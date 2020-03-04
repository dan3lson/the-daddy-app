require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TheDaddyApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    Rails.autoloaders.logger = method(:puts)
    routes.default_url_options[:host] = ENV['BASE_URL']
    routes.default_url_options[:protocol] = ENV['PROTOCOL']

  end
end
