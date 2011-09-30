OmniAuth.config.full_host = "http://uptospeed.se"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google, "uptospeed.se", "g_ysByjed_wnqipVx2bk8Quf", :scope => "https://www.google.com/calendar/feeds/", :domain => "newsdesk.se", :identifier => "https://www.google.com/accounts/o8/id", :callback_path => "/auth/google/callback"
  provider :google_apps, nil, :scope => "https://www.google.com/calendar/feeds/", :domain => "newsdesk.se", :identifier => "https://www.google.com/accounts/o8/id", :callback_path => "/auth/google_apps/callback"
end