class LearningsController < ApplicationController
  def create
    if Learning.create(params[:learning])
      flash = { :success => I18n.t(:'reads.success') }
    else
      flash = { :error => I18n.t(:'reads.error') }
    end
    redirect_to user_path(current_user), :flash => flash
  end
end