source 'https://rubygems.org'

gem 'compass-rails'
gem 'jquery-rails'
gem 'rails'
gem 'rake'
gem 'sass-rails'
gem 'sqlite3'
gem 'uglifier'

group :development do
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'rubocop', require: false
  gem 'rubocop-checkstyle_formatter', require: false
  gem 'rubocop-rspec', require: false
end

group :development, :test do
  gem 'awesome_print'
  gem 'guard-rspec'
  gem 'pry-byebug'
  gem 'spring-commands-rspec'
end

group :production do
  gem 'unicorn'
  gem 'yui-compressor'
end

group :test do
  gem 'mutant-rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
end
