require 'coveralls'
Coveralls.wear!('rails')

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
require 'rails/test_help'
require "minitest/pride"

class ActiveSupport::TestCase
  include AuthHelper
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  include FactoryGirl::Syntax::Methods
  include FactoryGirl::Syntax::Methods
  # Add more helper methods to be used by all tests here...
end

