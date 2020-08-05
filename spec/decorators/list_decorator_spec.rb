require 'rails_helper'

RSpec.describe ListDecorator do
  it "is instantiated with a list as argument" do
    list = double(list)

    expect(ListDecorator.new(list)).to be_truthy
  end

  it "delegates method calls to list argument" do
    list = double(list)
    allow(list).to receive(:open?)

    ListDecorator.new(list).open?

    expect(list).to have_received(:open?)
  end

  it "prepares message to send to actioncable" do
    list = double(list, title: 'titulo')

    expect(ListDecorator.new(list).message).to eq("A lista de tarefas \"titulo\" foi atualizada.")
  end

  it "broadcasts message when close method is called" do
    list = double(list, title: 'titulo')
    subject = ListDecorator.new(list)

    allow(list).to receive(:bookmark_user_ids).and_return([1])
    allow(list).to receive(:close).and_return(list)
    allow(ActionCable.server).to receive(:broadcast)

    subject.close

    expect(ActionCable.server).to have_received(:broadcast)
  end
end
