class WorkoutsController < ApplicationController
  def create
    if Workout.create(params[:workout])
      flash = { :success => "Workout created!" }
    else
      flash = { :error => "There was an error creating the Workout" }
    end
    redirect_to events_path, :flash => flash
  end
end