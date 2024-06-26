source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.6"

gem "active_storage_validations"
gem "administrate"
gem "ahoy_matey"
gem "bootsnap", ">= 1.4.2", require: false
gem "clearance"
gem "dartsass-rails", "~> 0.4.0"
gem "dotenv-rails"
gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "master"
gem "image_processing", "~> 1.2"
gem "jbuilder", "~> 2.7"
gem "mini_magick"
gem "pg", ">= 0.18", "< 2.0"
gem "premailer-rails"
gem "puma", "~> 3.11"
gem "rails", "~> 6.0.0"
gem "redis", "~> 4.0"
gem "redis-namespace", "~> 1.6"
gem "sidekiq"
gem "sidekiq-scheduler"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"
gem "wisper", "2.0.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-rails"
  gem "standard"
  gem "rspec-rails", "~> 4.0.2"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "letter_opener"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "database_cleaner"
  gem "factory_bot"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
