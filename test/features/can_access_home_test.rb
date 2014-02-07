require "test_helper"

feature "visiting the homepage" do
  scenario "the homepage exists/works" do
    visit "/"
    page.must_have_text "Check In On Me"
  end
end
