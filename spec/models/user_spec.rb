require 'rails_helper'

RSpec.describe User do
  it "has lists" do
    expect(User.new.lists).to be_truthy
  end
  
  it "has bookmarks" do
    expect(User.new.bookmarks).to be_truthy
  end
end
