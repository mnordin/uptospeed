class Event < ActiveRecord::Base
  has_many :users, :through => :attendances
  has_many :attendances
  belongs_to :office

  validates :google_id, :presence => true, :uniqueness => true
  validates :title, :presence => true
  validates :where, :presence => true

  scope :past, lambda { where("start_time < ?", Time.now) }
  scope :future, lambda { where("start_time > ?", Time.now) }
  scope :this_month, lambda { where("start_time > ?", Time.now.beginning_of_month) }
  scope :past_this_month, lambda { where("start_time > ?", Time.now.beginning_of_month).past }
  scope :old, lambda { where("start_time < ?", Time.now.beginning_of_month) }

  def duration
    end_time - start_time
  end

  def group_by_date
    start_time.to_date
  end

  def google_event
    service = Event.auth_google_service
    GCal4Ruby::Event.find(service, :id => google_id)
  end

  def self.total(time = Time.now)
    this_month = {:created_at => time.beginning_of_month..time.end_of_month}
    Attendance.where(this_month).count + Workout.where(this_month).count + Learning.where(this_month).count
  end

  def self.exists_before?(time)
    Event.order(:start_time).limit(1).first.start_time < time.beginning_of_week
  end

  def self.exists_after?(time)
    Event.order(:start_time).reverse_order.limit(1).first.start_time > time.end_of_week
  end

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
    calendar_id = fetch_calendar(service).id
    events.select!{|e| e.calendar_id == calendar_id}.sort!{|a,b| a.start_time <=> b.start_time}
    events.each do |event|
      event.attendees.delete_if {|a| a[:name] =~ /Up to Speed Stockholm/}
    end
  end

  def self.auth_google_service
    service = GCal4Ruby::Service.new
    service.authenticate(ENV['UPTOSPEED_USERNAME'], ENV['UPTOSPEED_PASSWORD'])
    service
  end

  def self.fetch_calendar(service = nil)
    unless service.present?
      service = auth_google_service
    end
    service.calendars.select{|cal| cal.title =~ /Up to Speed Stockholm/}.first
  end
end
