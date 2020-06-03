# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, Team do |t|
        t.user_id == user.id || t.users.where(id: user.id).present?
      end
      can :create, Team do |t|
        user
      end
      can :destroy, Team, user_id: user.id
    end
  end
end
