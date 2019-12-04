# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'rails_helper'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure(&:infer_spec_type_from_file_location!)
