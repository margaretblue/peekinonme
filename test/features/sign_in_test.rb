require "test_helper"

feature "users can sign in" do
  scenario "caregiver can sign in" do
    sign_in
    page.text.must_include "Signed in successfully"
    # page.must_include "Recent Check-Ins:"
  end
end
