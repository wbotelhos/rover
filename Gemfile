source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'jquery-rails'
gem 'listen'
gem 'rails', '~> 5'
gem 'rake'
gem 'sass-rails'
gem 'sprockets', '~> 3'
gem 'sqlite3'
gem 'uglifier'

group :development do
  gem 'rubocop-rspec', require: false
end

group :development, :test do
  gem 'pry-byebug'
end

group :production do
  gem 'unicorn'
  gem 'yui-compressor'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
end
