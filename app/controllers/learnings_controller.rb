class LearningsController < ApplicationController
  def create
    if Learning.create(params[:read])
      flash = { :success => I18n.t(:'reads.success') }
    else
      flash = { :error => I18n.t(:'reads.error') }
    end
    redirect_to events_path, :flash => flash
  end
end