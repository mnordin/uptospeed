class SessionsController < ApplicationController

  # sign in using omniauth
  def sign_in
    auth = request.env["omniauth.auth"]
    if user = User.find_by_email(auth["info"]["email"])
      session[:user_id] = user.id
      redirect_to root_path
    else
      user = User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to edit_user_path(user), :notice => "Welcome! Please enter your information"
    end
  end

  def failure
  end

  # sign out using omniauth
  def sign_out
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out"
  end
end
