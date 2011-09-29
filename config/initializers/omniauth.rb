Rails.configuration.middleware.use OmniAuth::Builder do
  provider :open_id, "g_ysByjed_wnqipVx2bk8Quf", {:name => "google", :identifier =>'https://www.google.com/accounts/o8/id', :callback_path => "/auth/google/callback", :domain => 'newsdesk.se', :scope => "https://www.google.com/calendar/feeds/"}
end