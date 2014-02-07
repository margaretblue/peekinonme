require "test_helper"

feature "visiting the homepage" do
  scenario "the homepage exists/works" do
    visit "/"
    page.must_include "Check In On Me"
  end
end
