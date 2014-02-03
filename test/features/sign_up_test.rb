require "test_helper"

feature "signing up" do
  scenario "caregiver signing up" do
    visit "/"
    click_on "Sign Up as Caregiver"
    fill_in "Name", with: caregiver(:caregiver).name
    fill_in "Email", with: caregiver(:caregiver).email
    fill_in "Phone", with: caregiver(:caregiver).phone
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Sign Up"
    page.text.must_include "You have successfully signed up as a caregiver"
  end

  scenario "patient signing up" do
    visit "/"
    click_on "Sign Up as Patient"
    fill_in "Name", with: patient(:patient).name
    fill_in "Email", with: patient(:patient).email
    fill_in "Phone", with: patient(:patient).phone
    fill_in "Street", with: patient(:patient).street
    fill_in "City", with: patient(:patient).city
    fill_in "Zip", with: patient(:patient).zip
    fill_in "Condition", with: patient(:patient).condition
    fill_in "Password", with "passowrd"
    fill_in "Password Confirmation", with "password"
    click_on "Sign Up"
    page.text.must.include "You have successfully signed up as a patient"

end

