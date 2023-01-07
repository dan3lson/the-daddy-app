# frozen_string_literal: true

# Class to represent the default mailer
class ApplicationMailer < ActionMailer::Base
  default from: "The Daddy App <hello@thedaddyapp.com>"
  layout "mailer"
end
