desc "Save all events a month ahead and sync attendee list"
task :cron => :environment do
  puts "Saving all new events"
  events_from_google = Event.fetch_week(:start_at => Time.now, :end_at => 1.month.from_now)
  events_from_google.each do |event_from_google|
    local_event = Event.find_or_initialize_by_google_id(event_from_google.id)
    if local_event.new_record?
      local_event.title = event_from_google.title
      local_event.where = event_from_google.where
      local_event.start_time = event_from_google.start_time
      local_event.end_time = event_from_google.end_time
      local_event.save
    end
  end
end