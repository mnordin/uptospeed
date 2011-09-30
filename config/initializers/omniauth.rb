Rails.configuration.middleware.use OmniAuth::Builder do
  provider :google, "newsdesk.se", "g_ysByjed_wnqipVx2bk8Quf", {
    :callback_path => "/auth/google/callback",
    :scope => "https://www.google.com/calendar/feeds/"
  }
end