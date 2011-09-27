Rails.configuration.middleware.use OmniAuth::Builder do
  provider :openid, nil, :name => 'google', :identifier =>'https://www.google.com/accounts/o8/id', :callback_path => "/auth/google/callback", :domain => 'newsdesk.se'
end