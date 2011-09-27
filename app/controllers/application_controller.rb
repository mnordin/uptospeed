class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      require_authed_user
    end
  end

  private
  def require_authed_user
    redirect_to "/auth/google" if session[:user_id].nil?
  end
end