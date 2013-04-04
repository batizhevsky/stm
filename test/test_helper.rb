ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require 'coveralls'
Coveralls.wear!('rails')

require "minitest/autorun"
require "minitest/rails"

# Add `gem "minitest-rails-capybara"` to the test group of your Gemfile
# and uncomment the following if you want Capybara feature tests
# require "minitest/rails/capybara"

# Uncomment if you want awesome colorful output
require "minitest/pride"

class ActiveSupport::TestCase
  include AuthHelper
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class MiniTest::Rails::ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end
