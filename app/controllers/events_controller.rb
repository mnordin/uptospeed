class EventsController < ApplicationController

  def index
    future_weeks = params[:future_weeks].try(:to_i) || 1
    past_weeks = params[:past_weeks].try(:to_i) || 1
    @events_grouped = Event.where("start_time > ? and end_time < ?", (Time.now - past_weeks.week).beginning_of_day, (Time.now + future_weeks.week).end_of_day).order("start_time DESC").group_by(&:group_by_date)
  end

  def show
    @event = Event.find(params[:id])
  end

  def map
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
