# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  user_name: Rails.application.credentials.dig(:sendgrid, :username),
  password: Rails.application.credentials.dig(:sendgrid, :password),
  domain: "thedaddyapp.com",
  address: "smtp.sendgrid.net",
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
