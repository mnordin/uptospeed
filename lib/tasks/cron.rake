desc "Saves all events a month ahead and sync attendee list"
task :cron => :environment do
  puts "Saving all new events"
  events_from_google = Event.fetch_events_from_google(:start_at => Time.now, :end_at => 2.weeks.from_now.end_of_week)
  events_from_google.each do |event_from_google|
    local_event = Event.find_or_initialize_by_google_id(event_from_google.id)
    if local_event.new_record?
      puts "Saving new event: #{event_from_google.title}"
      local_event.title = event_from_google.title
      local_event.where = event_from_google.where
      local_event.start_time = event_from_google.start_time
      local_event.end_time = event_from_google.end_time
      local_event.content = event_from_google.content
      
      sess = Patron::Session.new
      address = CGI.escape(local_event.where)
      response = sess.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false")
      result = JSON.parse(response.body)
      latlng = result["results"].first["geometry"]["location"] || ""
      local_event.lat = latlng["lat"] || ""
      local_event.lng = latlng["lng"] || ""
      
      local_event.save
      local_event = local_event.reload
    end
    event_from_google.attendees.each do |attendee|
      if user = User.find_by_email(attendee[:email])
        Attendance.find_or_create_by_user_id_and_event_id(user.id, local_event.id)
      end
    end
  end
end