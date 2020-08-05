require 'rails_helper'

RSpec.describe ListDecorator do
  it "is instantiated with a list as argument" do
    list = double(list)

    expect(ListDecorator.new(list)).to be_truthy
  end

  it "delegates method calls to list argument" do
    list = double(list)
    allow(list).to receive(:close)

    ListDecorator.new(list).close

    expect(list).to have_received(:close)
  end

  it "prepares message to send to actioncable" do
    list = double(list, title: 'titulo')

    expect(ListDecorator.new(list).message).to eq("A lista de tarefas \"titulo\" foi atualizada.")
  end
  it "broadcasts message to actioncable"
end
