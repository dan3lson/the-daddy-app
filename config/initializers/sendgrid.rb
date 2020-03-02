ActionMailer::Base.smtp_settings = {
  user_name: Rails.application.credentials.dig(:sendgrid, :username),
  password: Rails.application.credentials.dig(:sendgrid, :password),
  domain: Rails.application.credentials.dig(:sendgrid, :domain),
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}