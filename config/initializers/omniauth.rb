Rails.configuration.middleware.use OmniAuth::Builder do
  provider :google, "uptospeed.se", "g_ysByjed_wnqipVx2bk8Quf", :identifier =>'https://www.google.com/accounts/o8/id', :callback_path => "/auth/google/callback", :domain => 'newsdesk.se', :scope => "https://www.google.com/calendar/feeds/"
end