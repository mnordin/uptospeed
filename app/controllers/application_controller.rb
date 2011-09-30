class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      require_authed_user
    end
  end

  def require_authed_user
    redirect_to "/auth/google_apps"
  end
end