require "test_helper"

feature "caregiver homepage/dashboard page" do
  scenario "caregiver can add patient" do
    sign_in
    click_on "Add Patient"
    fill_in "Name", with: patients(:patient).name
    fill_in "Email", with: patients(:patient).email
    fill_in "Street", with: patients(:patient).street
    fill_in "City", with: patients(:patient).city
    fill_in "Zip", with: patients(:patient).zip
    fill_in "Phone", with: patients(:patient).phone
    fill_in "Condition", with: patients(:patient).condition
    # fill_in "Checkintime", with: patients(:patient).checkintime
    click_on "Create Patient"
    page.text.must_include "Patient was successfully created"
  end

  scenario "caregiver can edit their page" do
    sign_in
    click_on "Edit"
    fill_in "Email", with: users(:caregiver).email
    fill_in "Current password", with: "password"
    click_button "Update"
    page.text.must_include "You updated your account successfully"
  end

  # scenario "caregiver can see patients" do
  #   sign_in
  #   within :xpath ("/html/body/div/div") do
  #     click_on "See Patients"
  #   end
  #   page.text.must_include "Listing Patients"
  #   page.text.must_include patients(:patient).name
  # end
end

