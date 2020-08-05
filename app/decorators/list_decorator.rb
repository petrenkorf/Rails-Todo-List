class ListDecorator < SimpleDelegator
  def initialize(list)
    @list = list
    super
  end

  def message
    "A lista de tarefas \"#{@list.title}\" foi atualizada."
  end
end
