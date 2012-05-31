class WorkoutsController < ApplicationController
  def create
    if Workout.create(params[:workout])
      flash = { :success => I18n.t(:'workouts.success') }
    else
      flash = { :error => I18n.t(:'workouts.error') }
    end
    redirect_to user_path(current_user), :flash => flash
  end
end