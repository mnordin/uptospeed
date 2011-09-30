Rails.configuration.middleware.use OmniAuth::Builder do
  provider :google_apps, "newsdesk.se", "g_ysByjed_wnqipVx2bk8Quf", {
        :callback_path => "/auth/google_apps/callback",
        :scope => "https://www.google.com/calendar/feeds/"
  }
end