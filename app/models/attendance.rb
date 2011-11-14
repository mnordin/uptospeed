class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  # A user can't attend the same event more than once
  validates :user_id, :presence => true, :uniqueness => { :scope => :event_id }
  validates :event_id, :presence => true

  def self.create_or_destroy_by_params(params)
    service = Event.auth_google_service
    if params[:attending] == "true"
      unless Attendance.already_exists?(params)
        Attendance.create(:user_id => params[:user_id], :event_id => params[:id])
      end
    else
      if Attendance.already_exists?(params)
        a = Attendance.find_by_user_id_and_event_id(params[:user_id], params[:id])
        a.destroy
      end
    end
  end

  def self.already_exists?(params)
    Attendance.find_by_user_id_and_event_id(params[:user_id], params[:id]).present?
  end

end