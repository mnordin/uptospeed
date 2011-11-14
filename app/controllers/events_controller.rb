class EventsController < ApplicationController
  helper_method :weekend?

  def index
    now = params[:now].present? ? Time.parse(params[:now]) : Time.now
    if weekend?(now)
      start_date = now.beginning_of_day
      end_date = (now + 1.weeks).end_of_week
    else
      start_date = now.beginning_of_week
      end_date = now.end_of_week
    end
    @events_grouped = Event.where("start_time > ? and end_time < ?", start_date, end_date).order("start_time ASC").group_by(&:group_by_date)
    if !@events_grouped.has_key?(Time.now.to_date)
      date_range = (start_date.to_date..@events_grouped.keys.last)
      if date_range.cover?(Time.now.to_date)
        today = {Time.now.to_date => []}
        @events_grouped.merge!(today)
        new_hash = {}
        @events_grouped.keys.sort.map{|date| new_hash[date] = @events_grouped[date]}
        @events_grouped = new_hash
      end
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
    context = UserAttendsEventContext.new(:user => current_user, :event => @event)
    unless @event.users.include?(current_user) # user isnt already attending the event  
      context.attend_event
      notice = "Your attendance has been registered!"
    else
      context.unattend_event
      notice = "Your attendance has been removed!"
    end
    redirect_to @event
  end

  def weekend?(date)
    date.wday == 6 or date.wday == 0
  end
end
