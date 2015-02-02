ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)

require "rails/test_help"

require 'rspec/rails'
require 'rspec/autorun'

require 'data_migrator'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}

MIGRATOR_ROOT = File.expand_path('../..', __FILE__)

RSpec.configure do |config|

  config.mock_with :rspec

end