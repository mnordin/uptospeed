class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications
  end

  def create    
    auth = request.env["omniauth.auth"]
    Rails.logger.info("********#{auth}")
    
    if params[:provider] == "google"
      restrict_blocked_google_accounts
      log_in(auth)
    end
    
    current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'])
    flash[:notice] = "Authentication successful."
    redirect_to root_path
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

  private
  def log_in(omniauth_hash)
    user = User.find_or_create_by_omniauth_hash(omniauth_hash)
    session[:user_id] = user.id
  end

  def restrict_blocked_google_accounts
    blocked_accounts = %w(kundtjanst teknisk-support globalmarketing)
    username = request.env["omniauth.auth"]["user_info"]["email"].split("@").first
    if blocked_accounts.include?(username)
      render :text => "You can't use that Google Account, please use your personal account"
    end
    return true
  end
end
