class SessionsController < ApplicationController

  # sign in using omniauth
  def sign_in
    auth = request.env["omniauth.auth"]
    user = User.find_by_email(auth["user_info"]["email"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Signed in!"
  end

  def failure
  end

  # sign out using omniauth
  def sign_out
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out"
  end
end
