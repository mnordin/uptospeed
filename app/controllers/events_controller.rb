class EventsController < ApplicationController
  helper_method :weekend?

  def index
    start_date, end_date = display_range_based_on(params)
    @events_grouped = Event.where("start_time > ? and end_time < ?", start_date, end_date).order("start_time ASC").group_by(&:group_by_date)

    unless @events_grouped.has_key?(Time.now.to_date)
      @events_grouped[Time.now.to_date] = []
      @events_grouped = @events_grouped.sort {|a,b| a[0]<=>b[0]}
    end
    set_back_url
  end

  def show
    @event = Event.find(params[:id])
  end

  def map
    @event = Event.find(params[:id])
  end

  def attend
    @event = Event.find(params[:id])
    UserAttendsEventContext.new(:user => current_user, :event => @event)
    redirect_to @event
  end

  def weekend?(date)
    date.wday == 6 or date.wday == 0
  end

  private

  def display_range_based_on(params)
    now = params[:now].present? ? Time.parse(params[:now]) : Time.now
    if weekend?(now)
      [now.beginning_of_day, (now + 1.weeks).end_of_week]
    else
      [now.beginning_of_week, now.end_of_week]
    end
  end

end
