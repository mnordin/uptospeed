class ReadsController < ApplicationController
  def create
    if Read.create(params[:read])
      flash = { :success => "Read created!" }
    else
      flash = { :error => "There was an error creating the Read" }
    end
    redirect_to events_path, :flash => flash
  end
end