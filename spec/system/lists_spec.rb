require "rails_helper"

RSpec.describe "User creates a list" do
  let(:login_page) {LoginPage.new}
  let(:list_form_page) {ListsFormPage.new}

  fixtures :users
  
  context "without tasks" do
    it "redirects to lists page with success message" do
      login_page
        .visit_page
        .fill_form("user1@email.com", "password")
        .submit

      expect(current_path).to eql(lists_path) 

      list_form_page
        .visit_page
        .fill_form("Description", :public)
        .submit

      expect(current_path).to eql(lists_path)
    end
  end
end
