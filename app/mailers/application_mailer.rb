# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'scooter@scootergaries.com'
  layout 'mailer'
end
