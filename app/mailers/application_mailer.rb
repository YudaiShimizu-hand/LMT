class ApplicationMailer < ActionMailer::Base
  default from: ENV['WELCOME_MAILER_ADDRESS']
  layout "mailer"
end
