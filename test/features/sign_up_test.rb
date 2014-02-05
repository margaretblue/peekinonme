require "test_helper"

feature "signing up" do
  scenario "caregiver signing up" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: "caregiver@caregiver.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Caregiver name", with: users(:caregiver).caregiver_name
    fill_in "Caregiver phone", with: users(:caregiver).caregiver_phone
    click_button "Sign up"
    save_and_open_page
    page.text.must_include "Welcome! You have signed up successfully"
    page.text.must_include users(:caregiver).caregiver_name
    page.text.must_include users(:caregiver).caregiver_phone
  end
end

