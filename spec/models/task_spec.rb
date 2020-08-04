require 'rails_helper'

RSpec.describe Task do
  let(:valid_params) {{list_id: 1, title: "title"}}

  fixtures :task

  it "is valid with attributes"
  it "is created with status open"  
  it "is not valid with empty title"
  it "is not valid if title length is greater than 100 characters"
  it "can be closed"
  #it "has tasks associated"
end

