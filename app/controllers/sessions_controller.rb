class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    Rails.logger.info("********#{auth}")
    user = User.find_by_email(auth["user_info"]["email"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    store_google_credentials(auth)
    redirect_to root_url, :notice => "Signed in!"
  end

  def failure
    if get_google_credentials.present?
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    session[:credentials] = nil
    redirect_to root_path, :notice => "Logged out"
  end

  private
  def store_google_credentials(auth)
    session[:credentials] = auth["credentials"]
  end

  def get_google_credentials
    session[:credentials]
  end
end
