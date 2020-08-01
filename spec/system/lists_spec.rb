require "rails_helper"

RSpec.describe "User creates a list" do
  fixtures :users
  context "without tasks" do
    it "redirects to lists page with success message" do
      visit root_path
      expect(current_path).to eql(new_user_session_path) 
      fill_in "user_email", with: "user1@email.com"
      fill_in "user_password", with: "password"
      click_button "Log in"
      visit root_path
      expect(current_path).to eql(root_path) 
    end
  end
end
