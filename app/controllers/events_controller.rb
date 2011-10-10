class EventsController < ApplicationController

  def index
    start_at = params[:start_at].present? ? Time.parse(params[:start_at]) : Time.now
    @events = Event.where("start_time > ? and end_time < ?", start_at.beginning_of_week, start_at.end_of_week)
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    if Attendance.create_or_destroy_by_params(params)
      redirect_to params[:url]
    else
      redirect_to params[:url], notice: 'Nagot gick fel, forsok igen'
    end
  end
end
