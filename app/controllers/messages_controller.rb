class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user

    ActiveRecord::Base.transaction do
      if @message.messagable_type == "Talk"
        talk = Talk.find_talk_users(current_user.id, talk_params[:user_two_id], talk_params[:team_id])

        if talk.blank?
          talk = Talk.new(talk_params)
          talk.save
        end

        @message.messagable = talk
      end
      @message.save
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :messagable_id, :messagable_type, :sender_id)
  end

  def talk_params
    params.require(:talk).permit(:team_id, :user_two_id).merge(user_one_id: current_user.id)
  end
end
