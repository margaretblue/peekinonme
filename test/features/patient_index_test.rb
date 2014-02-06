require "test_helper"

feature "Patient index page" do
  scenario "caregiver can create new patient from index page" do
    sign_in_patient_index
    click_on "New Patient"
    fill_in "Name", with: patients(:patient).name
    fill_in "Email", with: patients(:patient).email
    fill_in "Street", with: patients(:patient).street
    fill_in "City", with: patients(:patient).city
    fill_in "Zip", with: patients(:patient).zip
    fill_in "Phone", with: patients(:patient).phone
    fill_in "Condition", with: patients(:patient).condition
    click_on "Create Patient"
    page.text.must_include "Patient was successfully created."
  end

  # scenario "Caregiver can see checkins for particular patient" do
  #   sign_in_patient_index
  #   within :xpath "html/body/div/div/table/tbody/tr[1]/td[9]/a" do
  #     click_on "Check-Ins"
  #   end
  #   page.must_include "Listing checkins"
  # end

  # scenario "Caregiver can go to patient show page" do
  #   sign_in_patient_index
  #   within :xpath "html/body/div/div/table/tbody/tr[1]/td[10]/a" do
  #     click_on "Show"
  #   end
  #   page.text.must_include patients(:patient).name
  # end

  # scenario "caregiver can edit patient" do
  #   sign_in_patient_index
  #   within :xpath "html/body/div/div/table/tbody/tr[1]/td[11]/a" do
  #     click_on "Edit"
  #   end
  #   fill_in "Name", with: patients(:patient2).name
  #   click_on "Update Patient"
  #   page.text.must_include "Patient was successfully updated."
  #   page.text.must_include patients(:patient2).name
  # end

  # scenario "caregiver can destroy a patient" do
  #   sign_in_patient_index
  #   within :xpath "html/body/div/div/table/tbody/tr[1]/td[12]/a" do
  #     click_on "Destroy"
  #   end
  #   click_on "OK"
  #   page.text.wont_include "things"


  # end
end
