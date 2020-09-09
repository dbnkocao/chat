class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    m = message.messagable
    # chat_name = (m.class == Channel) ? "#{m.team.id}_channels_#{m.id}" : "#{m.team.id}_talks_#{m.id}"
    # ChatChannel.broadcast_to({ channel: "chat_channel", messagable_id: message.messagable_id, messagable_type: message.messagable_type }, {
    ActionCable.server.broadcast("chat_channel_#{message.messagable_id}", {

      message: message.body,
      date: message.created_at.strftime("%d/%m/%y"),
      name: message.user.name,
    })
  end
end
