ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
end

class ActionDispatch::IntegrationTest
  def login_as(user)
    post login_url, params: { name: user.name, password: 'secret' }
  end
  
  def logout
    delete logout_url
  end
  
  def setup
    login_as users(:one)
  end
  
end
