class ChatChannel < ApplicationCable::Channel
  def subscribed
    if params[:messagable_type] == "Channel"
      stream_from "chat_channel_#{params[:messagable_id]}"
    else
      stream_from "chat_channel_#{params[:team_id] + [params[:user_two_id], params[:current_user]].sort.join("")}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

# class ChatChannel < ApplicationCable::Channel
#   delegate  :ability, to: :connection
#   protected :ability

#   def subscribed
#     if authorize_and_set_chat
#       stream_from "#{params[:team_id]}_#{params[:type]}_#{@chat}"
#     end
#   end

#   def receive(data)
#     @message = Message.new(body: data["message"], user: current_user)
#     @record.messages << @message
#   end

#   private

#   def authorize_and_set_chat
#     if params[:type] == "channels"
#       @record = Channel.find(params[:id])
#     elsif params[:type] == "talks"
#       @record = Talk.find_by(user_one_id: [params[:id], current_user.id], user_two_id: [params[:id], current_user.id], team: params[:team_id])
#     end
#     @chat = @record.id
#     (ability.can? :read, @record)? true : false
#   end
# end
