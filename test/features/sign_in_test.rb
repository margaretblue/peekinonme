require "test_helper"

feature "users can sign in" do
  scenario "patient can sign in" do
    sign_in(:patient)
    page.must_include "Thank you for signing in"
  end

  scenario "caregiver can sign in" do
    sign_in(:caregiver)
    page.must_include "Thank you for signing in"
    page.must_include "Recent Check-Ins:"
end
