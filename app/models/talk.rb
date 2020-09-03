class Talk < ApplicationRecord
  belongs_to :team
  belongs_to :user_one, :class_name => :User
  belongs_to :user_two, :class_name => :User
  has_many :messages, as: :messagable, :dependent => :destroy
  validates_presence_of :user_one, :user_two, :team

  def self.find_talk_users(user_one, user_two, team_id)
    Talk.where(user_one_id: user_one, user_two_id: user_two)
        .or(Talk.where(user_one_id: user_two, user_two_id: user_one))
        .where(team_id: team_id).first
  end
end
