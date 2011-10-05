class EventsController < ApplicationController
  #before_filter :require_authed_user, :only => [:index]

  def index
    start_at = params[:start_at].present? ? params[:start_at] : Time.now.beginning_of_week
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

    end
  end
end
