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
    if current_user.office.present?
      @events_grouped = current_user.office.events.where("start_time > ? and end_time < ?", start_date, end_date).order("start_time ASC").group_by(&:group_by_date)
      if !@events_grouped.has_key?(Time.now.to_date) && @events_grouped.present?
        date_range = (start_date.to_date..@events_grouped.keys.last)
        if date_range.cover?(Time.now.to_date)
          today = {Time.now.to_date => []}
          @events_grouped.merge!(today)
          new_hash = {}
          @events_grouped.keys.sort.map{|date| new_hash[date] = @events_grouped[date]}
          @events_grouped = new_hash
        end
      end
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
    if Attendance.create_or_destroy_by_params(params)
      redirect_to Event.find(params[:id])
    else
      redirect_to Event.find(params[:id]), notice: 'Nagot gick fel, forsok igen'
    end
  end

  def new_attendees
    @event = Event.find(params[:id])
    if current_user.office_id
      @users = User.where(:office_id => current_user.office_id)
    else
      @users = User.all
    end
  end

  def register_attendees
    @event = Event.find(params[:id])
    @event.users = Users.find(params[:attendees])
    @event.save
    redirect_to @event
  end

  private
  def weekend?(date)
    date.wday == 6 or date.wday == 0
  end
end
