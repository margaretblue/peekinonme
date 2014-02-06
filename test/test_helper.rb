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
    click_on "See Patients"
  end
end
