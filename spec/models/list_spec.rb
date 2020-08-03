require 'rails_helper'

RSpec.describe List do
  fixtures :users

  it "is valid with attributes" do
    expect(List.create(user_id: 1, title: "title", public: true).valid?).to be true
  end

  it "is created with status open" do
    expect(List.create(user_id: 1, title: "title", public: true).open?).to be true
  end
  
  it "is created with private visibility " do
    expect(List.create(user_id: 1, title: "title").public_visibility?).to be false
  end

  it "is not valid with empty title" do
    expect(List.create(user_id: 1, public: true).valid?).to be false
  end

  it "is not valid without visibility" do
    expect(List.create(user_id: 1, title: "title").valid?).to be true
  end

  it "is not valid if title length is greater than 100 characters" do
    expect(List.create(user_id: 1, title: "a"*101, public: true).valid?).to be false
  end

  it "can be closed"

  it "has tasks associated"
end
