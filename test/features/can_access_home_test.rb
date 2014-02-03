require "test_helper"

feature "visiting the homepage" do
  scenario "the homepage exists/workds" do
    visit "/"
    page.must_include "Welcome to Peekinonme"
  end
end
