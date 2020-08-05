class NotificationDecorator < SimpleDelegator
  def initialize(decorated)
    @decorated = decorated
    super
  end

  protected 
  
  def notificate_users(user_ids)
    user_ids.each do |id| 
      ActionCable.server.broadcast "list_update_notifier_channel_#{id}", content: "Lista #{self.display_name}"  
    end
  end

  def display_name; raise "MISSING METHOD: display_name"; end 
end
