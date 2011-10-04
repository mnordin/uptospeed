class Event < ActiveRecord::Base
  # Events are (only?) stored when someone does something to them, e.g. attends
  # This is to be able to add more actions on them, like comments
  belongs_to :user

  validate :google_id, :presence => true, :uniqueness => true

  def self.fetch_week(args = {})
    start_at = args[:start_at] if args[:start_at].present?
    end_at = args[:end_at] if args[:end_at].present?
    #events = GCal4Ruby::Event.find(service, "", {'start_min' => Time.now.beginning_of_week.utc.xmlschema, 'start_max' => Time.now.end_of_week.utc.xmlschema})
    calendar = fetch_google_calendar
    calendar.events.select{|ev| ev.start_time > Time.now.beginning_of_week && ev.start_time < Time.now.end_of_week}.sort!{ |a,b| a.start_time <=> b.start_time }
  end


  def self.auth_google_service
    service = GCal4Ruby::Service.new
    service.authenticate(ENV['UPTOSPEED_USERNAME'], ENV['UPTOSPEED_PASSWORD'])
    return service
  end

  def self.fetch_google_calendar(service = nil)
    unless service.present?
      service = auth_google_service
    end
    service.calendars.select {|cal| cal.title =~ /Up to Speed Stockholm/}.first
  end
end
