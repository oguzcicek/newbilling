require "rails_helper"

RSpec.feature "Orders", type: :feature do
  context "Create new order" do
    before(:each) do
      visit root_path
      within("form") do
        fill_in "order[quantity]", with: 100
      end
    end
    scenario "should be successful" do
      select "A Company", :from => "order[company_id]"
      click_button "Submit"
      expect(current_path).to eq order_index_path
    end
    scenario "should fail" do
      click_button "Submit"
      expect(page).to have_content("Company can't be blank")
    end
  end

  context "Create Randomized Order" do
    before(:each) do
      visit root_path
    end
    scenario "should be succesful" do
      click_link "Bulk Order"
      expect(current_path).to eq order_index_path
    end
  end

end