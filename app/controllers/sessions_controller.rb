class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    Rails.logger.info("********#{auth}")
    user = User.find_by_email(auth["user_info"]["email"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    store_google_credentials(auth)
    getAccessToken(auth["credentials"]["token"])
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
  def getAccessToken(oath_token)
    sess = Patron::Session.new
    sess.timeout = 10
    response = sess.post("https://www.google.com/accounts/OAuthGetAccessToken", {:oauth_consumer_key => "g_ysByjed_wnqipVx2bk8Quf", :oauth_token => oath_token, :oauth_verifier => session["credentials"]["oauth_verifier"], :oauth_signature_method => "HMAC-SHA1", :oauth_signature => "g_ysByjed_wnqipVx2bk8Quf", :oauth_timestamp => Time.now.to_i, :oauth_nonce => Digest::MD5.hexdigest(rand.to_s)})
    Rails.logger.info("********#{response}")
  end

  def store_google_credentials(auth)
    session[:credentials] = auth["credentials"]
    session[:credentials][:oauth_verifier] = params[:oauth_verifier]
  end

  def get_google_credentials
    session[:credentials]
  end
end
