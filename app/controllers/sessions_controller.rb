class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    Rails.logger.info("********#{auth}")
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    store_google_access_token(auth)
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to root_path, :notice => "Logged out"
  end

  private
  def store_google_access_token(auth)
    session[:access_token] = auth["extra"]["access_token"].token
  end
end
