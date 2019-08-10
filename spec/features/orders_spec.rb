require "rails_helper"

RSpec.feature "Orders", type: :feature do
  context "Create new order" do
    before(:each) do
      visit root_path
      within("form") do
        fill_in "order[quantity]", with: 100
      end
    end

    scenario "should fail" do
      click_button "Submit"
      expect(page).to have_content("Company can't be blank")
    end
  end



end