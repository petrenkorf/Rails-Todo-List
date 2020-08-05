class ListUpdateNotifierChannel < ApplicationCable::Channel
  def subscribed
    stream_from "list_update_notifier_channel_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
