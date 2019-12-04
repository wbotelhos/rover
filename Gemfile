# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'jquery-rails'
gem 'listen'
gem 'rails'
gem 'rake'
gem 'sassc-rails'
gem 'sprockets', '~> 3'

group :development do
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec', require: false
end

group :development, :test do
  gem 'pry-byebug'
end

group :production do
  gem 'unicorn'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
end
