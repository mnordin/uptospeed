require_relative '../../lib/email_processor'

Griddler.configure do |config|
  config.processor_class = EmailProcessor
  config.to = :email
  config.email_service = :sendgrid
end