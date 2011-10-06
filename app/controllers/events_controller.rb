class EventsController < ApplicationController

  def index
    start_at = params[:start_at].present? ? Time.parse(params[:start_at]) : Time.now
    @events = Event.where("start_time > ? and end_time < ?", start_at.beginning_of_week, start_at.end_of_week)
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    if Attending.create_or_destroy_by_params(params)
      redirect_to events_path(:start_at => Event.find(params[:event_id]).start_time.strftime("%Y-%m-%d")), notice: 'Din anmalan ar registrerad'
    else
      redirect_to events_path(:start_at => Event.find(params[:event_id]).start_time.strftime("%Y-%m-%d")), notice: 'Nagot gick fel, forsok igen'
    end
  end
end
