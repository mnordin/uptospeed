class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  after_create :attend_on_google
  after_destroy :unattend_on_google

  # A user can't attend the same event more than once
  validates :user_id, :presence => true, :uniqueness => { :scope => :event_id }
  validates :event_id, :presence => true

  def attend_on_google
    Event.attend_on_google(event.google_id, user)
  end

  def unattend_on_google
    Event.unattend_on_google(event.google_id, user)
  end

  def self.create_or_destroy_by_params(params)
    if params[:attending] == "true"
      unless Attendance.already_exists?(params)
        Attendance.create(:user_id => params[:user_id], :event_id => params[:id])
      end
    else
      if Attendance.already_exists?(params)
        Attendance.find_by_user_id_and_event_id(params[:user_id], params[:id]).destroy
      end
    end
  end

  def self.already_exists?(params)
    Attendance.find_by_user_id_and_event_id(params[:user_id], params[:id]).present?
  end

end