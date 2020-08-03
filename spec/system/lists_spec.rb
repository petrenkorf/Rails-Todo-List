require "rails_helper"

RSpec.describe "User access list page" do
  let(:login_page) {LoginPage.new}
  let(:list_form_page) {ListsFormPage.new}
  let(:lists_page) {ListsPage.new}

  fixtures :users
  
  context "without any list registered" do
    it "create without tasks" do
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
      expect(page).to have_selector('.card', count: 1)
    end
 
    it "create list with task" do
      login_page
        .visit_page
        .fill_form("user1@email.com", "password")
        .submit

      expect(current_path).to eql(lists_path) 

      list_form_page
        .visit_page
        .fill_form("Description", :public)
        .add_new_task("Tarefa 1")
        .submit

      expect(current_path).to eql(lists_path)
      expect(page).to have_selector('.card', count: 1)
    end
  end

  context "Has already registered a list" do
    fixtures :lists
    it "closes the created list" do
      login_page
        .visit_page
        .fill_form("user1@email.com", "password")
        .submit

      expect(current_path).to eql(lists_path) 

      lists_page
        .visit_page
        .close_first_list
      
      expect(current_path).to eql(lists_path) 
      expect(page).to have_selector('.closed', count: 1)
    end
  end
end
