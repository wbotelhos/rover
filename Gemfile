source 'https://rubygems.org'

gem 'compass-rails'
gem 'jquery-rails'
gem 'rails'
gem 'rake'
gem 'sass-rails'
gem 'sqlite3'
gem 'uglifier'

group :development do
  gem 'brakeman'                     , require: false
  gem 'bullet'
  gem 'capistrano-bundler'           , require: false
  gem 'capistrano-rails'             , require: false
  gem 'rubocop'                      , require: false
  gem 'rubocop-checkstyle_formatter' , require: false
  gem 'rubocop-rspec'                , require: false
end

group :development, :test do
  gem 'awesome_print'
  gem 'guard-rspec'
  gem 'pry-byebug'
  gem 'quiet_assets'
  gem 'spring-commands-rspec'
  gem 'thin'
end

group :production do
  gem 'unicorn'
  gem 'yui-compressor'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'mutant-rspec'
  gem 'rack_session_access'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'    , require: false
  gem 'simplecov'           , require: false
  gem 'simplecov-rcov'      , require: false
end
