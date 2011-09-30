OmniAuth.config.full_host = "http://uptospeed.se"

Rails.configuration.middleware.use OmniAuth::Builder do
  provider :google, "newsdesk.se", "g_ysByjed_wnqipVx2bk8Quf", {
    :callback_path => "/auth/google/callback",
    :identifier => "https://www.google.com/accounts/o8/id",
    :client_id => "9715209208.apps.googleusercontent.com",
    :client_secret => "iVYLH-oPgUPqI5JzLp6bcoKv",
    :scope => "https://www.google.com/calendar/feeds/"
  }
end