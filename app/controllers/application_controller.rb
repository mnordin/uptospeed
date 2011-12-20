class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # sessions_controller uses sign_in action to set user_id
  before_filter :require_authed_user, :except => :sign_in
  before_filter :set_locale, :except => :sign_in

  helper_method :current_user

  def manifest
    send_file "public/application.appcache", :type => 'text/cache-manifest'
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      require_authed_user
    end
  end

  protected
  def require_authed_user
    if session[:user_id].blank?
      redirect_to "/auth/google_apps"
    end
  end

  def set_locale
    I18n.locale = current_user.locale || current_user.office.default_locale rescue I18n.default_locale
  end

  def set_back_url
    session[:back_url] = request.fullpath
  end

  def remove_back_url
    session[:back_url] = nil
  end
end