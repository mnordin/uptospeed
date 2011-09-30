Rails.configuration.middleware.use OmniAuth::Builder do
  provider :open_id, nil, {
        :name => "google",
        :callback_path => "/auth/google/callback",
        :identifier => "https://www.google.com/accounts/o8/id",
        :domain => 'newsdesk.se',
        :consumer_key => "uptospeed.se",
        :consumer_secret => "g_ysByjed_wnqipVx2bk8Quf",
        :scope => "https://www.google.com/calendar/feeds/default/allcalendars/full"
  }
end