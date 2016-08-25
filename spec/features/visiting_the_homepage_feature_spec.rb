require 'rails_helper'

feature "visiting the homepage" do
  scenario "the user sees a home button" do
    visit "/"
    within("#login-nav") do
      expect(page).to have_content "Home"
    end
  end
end
