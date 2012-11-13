class AttendanceObserver < ActiveRecord::Observer

  def after_create(attendance)
    service = Event.auth_google_service
    google_event = attendance.event.google_event
    google_event.attendees << {email: attendance.user.email, name: attendance.user.name, role: "attendee", status: "accepted"}
    google_event.attendees.delete_if {|u| u[:name] =~ /Up to Speed Stockholm/}
    google_event.calendar = Event.fetch_calendar(service)
    google_event.save
  end

  def after_destroy(attendance)
    service = Event.auth_google_service
    google_event = attendance.event.google_event
    google_event.attendees.delete_if {|u| u[:email] == attendance.user.email}
    google_event.calendar = Event.fetch_calendar(service)
    google_event.save
  end

end
