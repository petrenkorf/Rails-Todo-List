require 'rails_helper'

RSpec.describe List do
  fixtures :users

  it "is valid with attributes" do
    list = List.create(user_id: 1, title: "title", public: true)

    expect(list.valid?).to be true
  end

  it "is not valid with empty title" do
    list = List.create(user_id: 1, public: true)

    expect(list.valid?).to be false
  end

  it "is not valid with visibility different than boolean values"

  it "is not valid if title length is greater than 100 characters"

  it "can be closed"

  it "has tasks associated"
end
