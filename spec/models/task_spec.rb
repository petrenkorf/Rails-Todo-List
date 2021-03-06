require 'rails_helper'

RSpec.describe Task do
  let(:valid_params) {{list_id: 1, description: "title"}}

  fixtures :lists

  it "is valid with attributes" do
    expect(Task.create(valid_params).valid?).to be true
  end

  it "is created with status not done" do
    expect(Task.new(valid_params).is_done?). to be false
  end 
  
  it "is not valid with empty description" do
    expect(Task.create({list_id: 1}).valid?). to be false
  end

  it "is not valid if description length is greater than 255 characters" do
    expect(Task.create({list_id: 1, description: "t"*256}).valid?).to be false
  end

  it "can be closed" do
    task = Task.new(valid_params)
    
    expect(task.mark_as_done.is_done?).to be true
  end

  #it "has tasks associated"
end

