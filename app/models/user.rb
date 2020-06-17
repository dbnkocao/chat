class User < ApplicationRecord
  has_many :teams
  has_many :messages
  has_many :talks, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def my_teams
    self.teams + Team.joins(:team_users).where(team_users: { user_id: self.id })
  end
end
