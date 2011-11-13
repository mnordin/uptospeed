module AttendanceRole
  
  def self.attend_on_google(google_id, user)
    #service = Event.auth_google_service
    #google_event = GCal4Ruby::Event.find(service, id: google_id)
    #google_event.attendees << {email: user.email, name: user.name, role: "attendee", status: "accepted"}
    #google_event.attendees.delete_if {|u| u[:name] =~ /Up to Speed Stockholm/}
    #google_event.calendar = Event.fetch_calendar(service)
    #google_event.save
    Rails.logger.info("******** SYNKAR MOT GOOGLE, ATTENDING ON GOOGLE FFS")
    
  end

  def self.unattend_on_google(google_id, user)
    service = Event.auth_google_service
    google_event = GCal4Ruby::Event.find(service, id: google_id)
    google_event.attendees.delete_if {|u| u[:email] == user.email}
    google_event.calendar = Event.fetch_calendar(service)
    google_event.save
  end
  
end