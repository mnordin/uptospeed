class EventsController < ApplicationController

  def index
    now = params[:now].present? ? Time.parse(params[:now]) : Time.now
    @events_grouped = Event.where("start_time > ? and end_time < ?", (now - 5.days).beginning_of_day, (now + 5.days).end_of_day).order("start_time ASC").group_by(&:group_by_date)
    unless @events_grouped.has_key? Time.now.to_date
      today = {Time.now.to_date => []}
      @events_grouped.merge!(today)
      new_hash = {}
      @events_grouped.keys.sort.map{|date| new_hash[date] = @events_grouped[date]}
      @events_grouped = new_hash
    end
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
