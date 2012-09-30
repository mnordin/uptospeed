class EventsController < ApplicationController
  helper_method :weekend?

  def index
    if current_user.office.present?
      @events_grouped = group_events(set_start_and_end_date(params))
    end
    @learning = Learning.new(:user => current_user)
    @workout = Workout.new(:user => current_user)
    set_back_url
  end

  def show
    @event = Event.find(params[:id])
  end

  def map
    @event = Event.find(params[:id])
  end

  def attend
    if Attendance.create_or_destroy_by_params(params[:now])
      redirect_to Event.find(params[:id])
    else
      redirect_to Event.find(params[:id]), notice: 'Nagot gick fel, forsok igen'
    end
  end

  def new_attendees
    @event = Event.find(params[:id])
    if current_user.office_id
      @users = User.where(:office_id => current_user.office_id).order(:first_name)
    else
      @users = User.all.order(:first_name)
    end
  end

  def register_attendees
    @event = Event.find(params[:id])
    @event.users << User.find(params[:attendees].keys)
    @event.save
    redirect_to @event
  end

  private
  def weekend?(date)
    date.wday == 6 or date.wday == 0
  end

  def group_events(start_date, end_date)
    events_grouped = current_user.office.events.where("start_time > ? and end_time < ?", start_date, end_date).order("start_time ASC").group_by(&:group_by_date)
    if !events_grouped.has_key?(Time.now.to_date) && events_grouped.present?
      date_range = (start_date.to_date..events_grouped.keys.last)
      if date_range.cover?(Time.now.to_date)
        today = {Time.now.to_date => []}
        events_grouped.merge!(today)
        new_hash = {}
        events_grouped.keys.sort.map{|date| new_hash[date] = events_grouped[date]}
        events_grouped = new_hash
      end
    end
    events_grouped
  end

  def set_start_and_end_date(params_now)
    now = params_now.present? ? Time.parse(params_now) : Time.now
    if weekend?(now)
      start_date = now.beginning_of_day
      end_date = (now + 1.weeks).end_of_week
    else
      start_date = now.beginning_of_week
      end_date = now.end_of_week
    end
    [start_date, end_date]
  end
end