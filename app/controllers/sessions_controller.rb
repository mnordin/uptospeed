class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    Rails.logger.info("********#{auth}")
    user = User.find_by_email(auth["user_info"]["email"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Signed in!"
  end

  def failure
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out"
  end
end
