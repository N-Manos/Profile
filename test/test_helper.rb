Rails.env = "test"
puts "Current environment: #{Rails.env}"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"
require 'coveralls'
Coveralls.wear!

require 'coveralls/rake/task'
Coveralls::RakeTask.new

def sign_up_a_new_user
  # Given a registration form
  visit "/"
  click_on "Sign Up"

  # When I register with valid info
  fill_in "Email", with: "test@example.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_on "Sign up"
end

def sign_in(role = :editor)
  visit new_user_session_path
  fill_in "Email", with: users(role).email
  fill_in "Password", with: "password"
  click_on "Log in"
end

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
