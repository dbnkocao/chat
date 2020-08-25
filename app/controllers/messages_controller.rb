class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:body, :messagable_id, :messagable_type, :sender_id)
  end
end
