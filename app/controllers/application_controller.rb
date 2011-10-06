class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # sessionscontroller uses create action to set user_id
  before_filter :require_authed_user, :except => :create

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      require_authed_user
    end
  end

  protected
  def require_authed_user
    if session[:user_id].blank?
      redirect_to "/auth/google_apps"
    end
  end
end