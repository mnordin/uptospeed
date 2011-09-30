Rails.configuration.middleware.use OmniAuth::Builder do
  provider :google_apps, nil, {
        :callback_path => "/auth/google/callback",
        :identifier => "https://www.google.com/accounts/o8/id",
        :domain => 'newsdesk.se',
        :client_id => "9715209208.apps.googleusercontent.com",
        :client_secret => "iVYLH-oPgUPqI5JzLp6bcoKv",
        :consumer_key => "uptospeed.se",
        :consumer_secret => "g_ysByjed_wnqipVx2bk8Quf",
        :scope => "http://www.google.com/calendar/feeds/"
  }
end