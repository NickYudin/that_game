source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.0.0'
# Use pg as the database for Active Record
gem "pg", "~> 1.1"
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'turbo-rails', '~> 1.0.0'

gem 'aasm'
gem 'after_commit_everywhere', '~> 1.0'
gem 'devise', git: 'https://github.com/heartcombo/devise', ref: '8593801'
gem 'cancancan'
gem 'faker'
gem 'mechanize'
gem 'hotwire-rails'
gem 'sprockets-rails'

gem 'pry-rails'
gem 'pry-byebug'

# sprradesheets parsing:
gem 'roo', '~> 2.8.0'

gem 'rubocop-rails', require: false
gem 'rubocop-rspec', require: false
# social networks auth:
gem 'omniauth-rails_csrf_protection'
gem 'dotenv-rails'
gem 'omniauth-google-oauth2'
gem 'omniauth-vkontakte'

gem 'aws-sdk-s3'
# paginaton:
gem 'will_paginate', '~> 3.3'
# fulltext search:
gem 'ransack', github: 'activerecord-hackery/ransack'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'rspec-rails', '~> 5.0.0'
  gem 'factory_bot_rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'simplecov', require: false, group: :test
