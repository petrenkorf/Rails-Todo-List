require 'rails_helper'

RSpec.describe List do
  let(:valid_params) {{user_id: 1, title: "title", public: true}}

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

  it "can be closed" do
    expect(List.new(valid_params).close.closed?).to be(true)
  end

  it "has tasks associated" do
    expect(List.new(valid_params).tasks).to be_truthy
  end

  it "saves tasks using nested_attributes" do
    params = {user_id: 1, title: "titulo", public: true, tasks_attributes: [{description: "task description"}]}
    list = List.new(params)
    list.save

    expect(list.tasks.count).to be(1)
  end

  it "returns array containing ids of each user that bookmarked that list" do
    list = List.create(valid_params)
    list.bookmarks.create({user_id: 3})

    expect(list.bookmark_user_ids).to eq([3])
  end
end
