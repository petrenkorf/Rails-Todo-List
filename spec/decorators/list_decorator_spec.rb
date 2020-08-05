require 'rails_helper'

RSpec.describe ListDecorator do
  it "is instantiated with a list as argument" do
    list = double(list)

    expect(ListDecorator.new(list)).to be_truthy
  end
  it "delegates method calls to list argument"
  it "formats list title"
  it "broadcasts message to actioncable"
end
