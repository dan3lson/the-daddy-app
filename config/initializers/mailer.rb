Rails.application.configure do
  config.action_mailer.default_url_options = {host: ENV["BASE_URL"], protocol: ENV["PROTOCOL"]}
  config.action_mailer.asset_host = "#{ENV["PROTOCOL"]}://#{ENV["BASE_URL"]}"
  config.action_mailer.preview_path = "#{Rails.root}/spec/mailers/previews"
  config.serve_static_assets = true
end
