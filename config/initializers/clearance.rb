# frozen_string_literal: true

Clearance.configure do |config|
  config.allow_sign_up = true
  config.routes = false
  config.mailer_sender = "hello@thedaddyapp.com"
  config.rotate_csrf_on_sign_in = true
end
