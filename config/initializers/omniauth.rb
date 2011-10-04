Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_apps, nil, {:callback_path => "/auth/google_apps/callback", :domain => 'newsdesk.se'}
end