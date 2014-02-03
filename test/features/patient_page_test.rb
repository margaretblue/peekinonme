require "test_helper"

feature "patient dashboard/home page" do
  scenario "There is a comment box"
    sign_in(:patient)
    page.must_include "Message to caregiver"
  end

  scenario "patient is checking in online" do
    sign_in(:patient)
    fill_in "Message to caregiver", with "This is my message"
    click_on "CHECK IN"
    page.must_include "Thank you for checking in"
  end
end
