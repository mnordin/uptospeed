source 'http://rubygems.org'

gem 'rails', '3.2.8'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test, :development do
  gem "rspec-rails"
end

gem 'json'
gem "pg", "0.11.0"

gem "gcal4ruby"

# Beta Omniauth with new specific gem for OpenId, https://github.com/intridea/omniauth
#gem 'oa-openid', "~> 0.3.0"
gem "omniauth"
gem "omniauth-google-apps"

# Airbrake for debugging
# periodically getting threaderrors, version is pulled from github as fix
# https://github.com/37signals/pow/issues/191
gem "airbrake"

# Thin speeds up environment on Cedar, http://devcenter.heroku.com/articles/cedar#using_cedar
gem 'thin'

# New relic for Heroku
gem 'newrelic_rpm'