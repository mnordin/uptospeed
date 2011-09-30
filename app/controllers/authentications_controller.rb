class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create    
    auth = request.env["omniauth.auth"]
    Rails.logger.info("********#{auth}")
    user = Authentication.find_by_provider_and_uid(auth["provider"], auth["uid"]).user || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to root_path
  end

  # default action for omniauth failures (for debugging)
  def failure
    render :text => request.env["omniauth.auth"].to_yaml
  end

  def log_out
    session[:user_id] = nil
    redirect_to root_path, :notice => "Signed out!"
  end

  private
  def restrict_blocked_google_accounts
    blocked_accounts = %w(kundtjanst teknisk-support globalmarketing)
    username = request.env["omniauth.auth"]["user_info"]["email"].split("@").first
    if blocked_accounts.include?(username)
      render :text => "You can't use that Google Account, please use your personal account"
    end
    return true
  end
end
