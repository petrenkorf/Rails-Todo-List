class ListDecorator < SimpleDelegator
  def initialize(list)
    @list = list
    super
  end

  def message
    "A lista de tarefas \"#{@list.title}\" foi atualizada."
  end

  def close
    list = @list.close

    list.bookmark_user_ids.each do |id| 
      ActionCable.server.broadcast "list_update_notifier_channel_#{id}", content: self.message  
    end

    list
  end
end
