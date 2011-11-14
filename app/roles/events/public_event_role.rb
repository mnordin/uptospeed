module PublicEventRole
  
  def attend_on_google(user)
    google_id = self.google_id
    #service = Event.auth_google_service
    #google_event = GCal4Ruby::Event.find(service, id: google_id)
    #google_event.attendees << {email: user.email, name: user.name, role: "attendee", status: "accepted"}
    #google_event.attendees.delete_if {|u| u[:name] =~ /Up to Speed Stockholm/}
    #google_event.calendar = Event.fetch_calendar(service)
    #google_event.save
    Rails.logger.info("******** synkar #{self.title} mot google, attending!")
    
  end

  def unattend_on_google(user)
    google_id = self.google_id
    #service = Event.auth_google_service
    #google_event = GCal4Ruby::Event.find(service, id: google_id)
    #google_event.attendees.delete_if {|u| u[:email] == user.email}
    #google_event.calendar = Event.fetch_calendar(service)
    #google_event.save
    Rails.logger.info("******** synkar #{self.title} mot google, unattending!")
  end
  
end