require "rails_helper"

RSpec.describe "User access public lists" do
  let(:login_page) {LoginPage.new}
  let(:public_lists_page) {PublicListsPage.new}
  let(:bookmarks_page) {PublicListsPage.new}

  fixtures :users
  fixtures :lists
  
  it "see public list from other users" do
    login_page
      .visit_page
      .fill_form("user1@email.com", "password")
      .submit

    expect(current_path).to eql(lists_path) 

    public_lists_page
      .visit_page

    expect(current_path).to eql(lists_public_path)
    expect(page).to have_selector('.card', count: 1)
  end

  it "bookmarks public list of other user" do
    login_page
      .visit_page
      .fill_form("user1@email.com", "password")
      .submit

    expect(current_path).to eql(lists_path) 

    public_lists_page
      .visit_page
      .bookmark_first_list

    expect(current_path).to eql(lists_public_path)
    
    bookmarks_page
      .visit_page
    
    expect(page).to have_selector('.card', count: 1)
  end
end

