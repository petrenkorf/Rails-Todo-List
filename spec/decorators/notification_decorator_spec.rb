require 'rails_helper'

RSpec.describe NotificationDecorator do
  it "sends notification to each item of array argument" do
    mock      = double('decorable')
    decorator = NotificationDecorator.new(mock)
    
    allow(ActionCable.server).to receive(:broadcast)
    allow(decorator).to receive(:display_name).and_return "Error"
        
    array = [1, 2]
    decorator.send(:notificate_users, array)
    expect(ActionCable.server).to have_received(:broadcast).exactly(2).times
  end 
end

