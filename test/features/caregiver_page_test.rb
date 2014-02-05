require "test_helper"

feature "caregiver homepage/dashboard page" do
  # scenario "there's a list of checkins" do
  #   sign_in(:caregiver)
  #   page.text.must_include "Latest Check-Ins"
  #   # page.txt.must_include "seeded checkins"
  # end

  # scenario "caregiver can update patient's info" do
  #   sign_in(:caregiver)
  #   click_on "Update Patient Info"
  #   fill_in "Street", with: patients(:patient2).street
  #   click_on "Submit"
  #   page.must_include patients(:patient2).street
  #   page.wont_include patients(:patient).street
  # end

  # scenario "caregiver can see last checkin" do
  #   sign_in(:caregiver)
  #   page.must_include "Last Sign In:"
  #   # page.must_include (last sign-in object)
  # end

  # scenario "caregiver can see last message" do
  #   sign_in(:caregiver)
  #   page.must_include "Last Message"
  #   # page.must_include (last message object)
  # end
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
end

