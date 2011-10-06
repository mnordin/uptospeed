class Event < ActiveRecord::Base
  has_many :users, :through => :attendings
  has_many :attendings

  validates :google_id, :presence => true, :uniqueness => true

  def self.fetch_events_from_google(args = {})
    start_at = args[:start_at].present? ? args[:start_at] : Time.now.beginning_of_week
    end_at = args[:end_at].present? ? args[:end_at] : Time.now.end_of_week

    service = Event.auth_google_service
    events = GCal4Ruby::Event.find(service, "", {
      "recurrence-expansion-start"  => start_at.utc.xmlschema,
      "start-min"                   => start_at.utc.xmlschema,
      "recurrence-expansion-end"    => end_at.utc.xmlschema,
      "start-max"                   => end_at.utc.xmlschema,
      "ctz"                         => "Europe/Stockholm",
      "singleevents"                => true
    })
    calendar_id = Event.fetch_calendar(service).id
    events.select!{|e| e.calendar_id == CGI.escape("newsdesk.se_tr45ab3op4eh54497ko4073118@group.calendar.google.com")}.sort!{|a,b| a.start_time <=> b.start_time}
    events.each do |event|
      event.attendees.delete_if{|a| a[:name] =~ /Up to Speed Stockholm/}
    end
  end

  def self.auth_google_service
    service = GCal4Ruby::Service.new
    service.authenticate(ENV['UPTOSPEED_USERNAME'], ENV['UPTOSPEED_PASSWORD'])
    return service
  end

  def self.fetch_calendar(service = nil)
    unless service.present?
      service = auth_google_service
    end
    service.calendars.select{|cal| cal.title =~ /Up to Speed Stockholm/}.first
    # or id "newsdesk.se_tr45ab3op4eh54497ko4073118@group.calendar.google.com"
  end


  def self.attend_on_google(google_id, user)
    service = Event.auth_google_service
    google_event = GCal4Ruby::Event.find(service, :id => google_id)
    google_event.attendees << {:email => user.email, :name => user.name, :role => "attendee", :status => "accepted"}
    google_event.calendar = Event.fetch_calendar(service)
    google_event.save
  end

  def self.unattend_on_google(google_id, user)
    service = Event.auth_google_service
    google_event = GCal4Ruby::Event.find(service, :id => google_id)
    google_event.attendees.delete_if {|u| u[:email] == user.email}
    google_event.calendar = Event.fetch_calendar(service)
    google_event.save
  end
end
