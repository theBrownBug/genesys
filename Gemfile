# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.7.4'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

gem 'sentry-raven'
gem 'groupdate'

gem 'activerecord-session_store'
gem 'bootsnap'
gem 'puma'
gem 'rails', '~> 6.1', '>= 6.1.4'
gem 'responders'
gem "chartkick"

gem 'webpacker'

gem 'pg'

gem 'hamlit'
gem 'hamlit-rails'

gem 'draper'
gem 'ransack'
gem 'simple_form'

gem 'bootstrap-will_paginate'
gem 'will_paginate'

gem 'cancancan'
gem 'devise'
gem 'devise_cas_authenticatable'
gem 'devise_ldap_authenticatable'

gem 'daemons'
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'whenever'

gem 'rubocop', require: false
gem 'rubocop-rails', require: false
gem 'rubocop-rspec', require: false

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :development do
  gem 'epi_deploy', github: 'epigenesys/epi_deploy'

  gem 'listen'
  gem 'web-console'

  gem 'capistrano'
  gem 'capistrano-bundler', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false

  gem 'annotate'
  gem 'letter_opener'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'webdrivers'

  gem 'database_cleaner'
  gem 'launchy'
  gem 'simplecov'
end
