class Message < ApplicationRecord
  belongs_to :messagable, polymorphic: true
  belongs_to :user
  validates_presence_of :body, :user

  def channel_name
    if messagable_type == "Channel"
      "chat_channel_#{self.messagable_id}"
    else
      "chat_channel_#{self.messagable.team_id.to_s + [self.messagable.user_one_id, self.messagable.user_two_id].sort.join("")}"
    end
  end

  after_create_commit { MessageBroadcastJob.perform_now self }
end
