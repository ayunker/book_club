source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.7"

# Use specific branch of Rails
gem "rails", "~> 8.1.1"
gem "solid_cable"

gem "kamal", "~> 1.8.1"

gem "sqlite3", ">= 1.4"
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

gem "tailwindcss-rails", "~> 2.3"
gem "puma"

# Use Redis adapter to run Action Cable in production
# TODO: can I remove?
gem "redis", "~> 4.0"

gem "bootsnap", require: false

group :development, :test do
  gem "standard"
  gem "pry"
end

group :development do
  gem "htmlbeautifier"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
