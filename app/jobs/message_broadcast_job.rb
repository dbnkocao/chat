class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast(message.channel_name, {

      message: message.body,
      date: message.created_at.strftime("%d/%m/%y"),
      name: message.user.name,
    })
  end
end
