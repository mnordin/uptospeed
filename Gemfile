source "http://rubygems.org"

gem "rails", "3.2.8"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "sass-rails", "~> 3.2.5"
  gem "coffee-rails", "~> 3.2.2"
  gem "uglifier", "~> 1.3.0"
end

group :test, :development do
  gem "rspec-rails", "~> 2.11.0"
  gem "factory_girl", "~> 4.2.0"
end

gem "json", "~> 1.7.5"
gem "pg", "~> 0.11.0"
gem "patron", "~> 0.4.16"

gem "gcal4ruby", "~> 0.5.5"

gem "griddler", "~> 0.5.0"

# Beta Omniauth with new specific gem for OpenId, https://github.com/intridea/omniauth
#gem "oa-openid", "~> 0.3.0"
gem "omniauth", "~> 1.1.1"
gem "omniauth-google-apps", "~> 0.0.2"

# Airbrake for debugging
# periodically getting threaderrors, version is pulled from github as fix
# https://github.com/37signals/pow/issues/191
gem "airbrake", "~> 3.1.3"

# Thin speeds up environment on Cedar, http://devcenter.heroku.com/articles/cedar#using_cedar
gem "thin", "~> 1.4.1"

# New relic for Heroku
gem "newrelic_rpm", "~> 3.4.2"