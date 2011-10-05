class Attending < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  # TODO refactor .create_or_destroy_by_params google sync to these two filter methods!
  # after_create :set_attending_on_google
  # after_destroy :remove_attending_on_google

  # A user can't attend the same event more than once
  validates :user_id, :uniqueness => { :scope => :event_id }


  def self.create_or_destroy_by_params(params)
    service = Event.auth_google_service
    if params[:attending].present?
      if Attending.find_by_user_id_and_event_id(params[:user_id], params[:id]).blank?
        # user wants to attend
        Attending.create(:user_id => params[:user_id], :event_id => params[:id])
        
        google_event = GCal4Ruby::Event.find(service, :id => Event.find(params[:id]).google_id)
        user = User.find(params[:user_id])
        google_event.attendees << {:email => user.email, :name => user.name, :role => "attendee", :status => "accepted"}
        google_event.calendar = Event.fetch_up_to_speed_calendar(service)
        google_event.save
      else
        # user has already attended and posted attending again, do nothing
        return true
      end
    else
      if Attending.find_by_user_id_and_event_id(params[:user_id], params[:id]).present?
        # user wants to unattend (remove an atending)
        Attending.find_by_user_id_and_event_id(params[:user_id], params[:id]).destroy

        google_event = GCal4Ruby::Event.find(service, :id => Event.find(params[:id]).google_id)
        user = User.find(params[:user_id])
        google_event.attendees.delete_if {|u| u[:email] == user.email}
        google_event.calendar = Event.fetch_up_to_speed_calendar(service)
        google_event.save
      else
        # user is not attending and posts not-attending, do nothing
        return true
      end
    end
  end
end