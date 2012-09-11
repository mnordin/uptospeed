Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_apps, :callback_path => "/auth/google_apps/callback", :domain => 'newsdesk.se'
end