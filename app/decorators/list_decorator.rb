class ListDecorator < SimpleDelegator
  def initialize(list)
    @list = list
    super
  end
end
