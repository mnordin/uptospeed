class Attending < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  after_create :enqueue_attend_on_google
  after_destroy :enqueue_unattend_on_google

  # A user can't attend the same event more than once
  validates :user_id, :uniqueness => { :scope => :event_id }

  def enqueue_attend_on_google
    Event.send_later(:attend_on_google, event.google_id, user)
  end

  def enqueue_unattend_on_google
    Event.send_later(:unattend_on_google, event.google_id, user)
  end

  def self.create_or_destroy_by_params(params)
    service = Event.auth_google_service
    if params[:attending].present?
      unless Attending.already_exists?(params)
        Attending.create(:user_id => params[:user_id], :event_id => params[:id])
      end
    else
      if Attending.already_exists?(params)
        a = Attending.find_by_user_id_and_event_id(params[:user_id], params[:id])
        a.destroy
      end
    end
  end

  def self.already_exists?(params)
    Attending.find_by_user_id_and_event_id(params[:user_id], params[:id]).present?
  end

end