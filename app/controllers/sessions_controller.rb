class SessionsController < ApplicationController

  @@auth = {}

  def create
    auth = request.env["omniauth.auth"]
    Rails.logger.info("********#{auth}")
    #user = User.find_by_provider_and_uid(params[:provider], auth["uid"]) || User.create_with_omniauth(auth)
    #session[:user_id] = user.id
    @@auth = auth
    store_google_credentials(auth)
    redirect_to root_url, :notice => "Signed in!"
  end

  # Copy from create action
  def failure
    #if get_google_credential.present?
      Rails.logger.info("******** @@auth: #{@@auth}")
      Rails.logger.info("********get_google_credential #{get_google_credential}")
      store
      user = User.find_by_provider_and_uid("google", @@auth["uid"]) || User.create_with_omniauth(@@auth)
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed in from #failure!"
    #end
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to root_path, :notice => "Logged out"
  end

  private
  def store_google_credentials(auth)
    session[:credentials] = auth["credentials"]
  end

  def get_google_credential
    session[:credentials]
  end
end
