ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)

require "rails/test_help"

require 'rspec/rails'
require 'data_migrator'

MIGRATOR_ROOT = File.expand_path('../..', __FILE__)

RSpec.configure do |config|

  config.mock_with :rspec

end