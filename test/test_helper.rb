ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all
end

class FeatureTest < MiniTest::Spec
    include Rails.application.routes.url_helpers
    include Capybara::DSL
    register_spec_type(/feature$/, self)
end

def sign_in
  visit "/"
  click_on "Sign In"
  fill_in "Email", with: users(:caregiver).email
  fill_in "Password", with: "password"
  click_button "Sign in"
end

def sign_in_patient_index
  visit "/"
  click_on "Sign In"
  fill_in "Email", with: users(:caregiver).email
  fill_in "Password", with: "password"
  click_button "Sign in"
  click_link 'See Patient List'
end

Turn.config do |c|
  c.format = :outline
  c.trace = '2'
end
