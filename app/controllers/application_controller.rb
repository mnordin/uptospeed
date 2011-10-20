class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # sessionscontroller uses create action to set user_id
  before_filter :require_authed_user, :except => :create

  helper_method :current_user

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

  def set_back_url
    session[:back_url] = request.fullpath
  end

  def remove_back_url
    session[:back_url] = nil
  end
end