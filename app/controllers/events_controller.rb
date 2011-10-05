class EventsController < ApplicationController
  #before_filter :require_authed_user, :only => [:index]

  def index
    start_at = params[:start_at].present? ? params[:start_at] : Time.now.beginning_of_week
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    if Attending.create_or_destroy_by_params(params)
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render action: "new"
    end
  end
end
