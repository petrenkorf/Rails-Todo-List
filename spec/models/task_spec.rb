require 'rails_helper'

RSpec.describe Task do
  let(:valid_params) {{list_id: 1, description: "title"}}

  fixtures :lists

  it "is valid with attributes" do
    expect(Task.create(valid_params).valid?).to be true
  end

  it "is created with status open" do
    expect(Task.create(valid_params).open?). to be true
  end 
  it "is not valid with empty title"
  it "is not valid if title length is greater than 100 characters"
  it "can be closed"
  #it "has tasks associated"
end

