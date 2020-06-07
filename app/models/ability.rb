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

      # can :read, TeamUser do |tu|
      #   tu.user == user
      # end
      
      can :create, TeamUser do |tu|
        tu.team.user == user
      end

      can :destroy, TeamUser do |tu|
        tu.team.user == user
      end

      can :read, Channel do |c|
        user.teams.include?(c.team) ||
        c.team.users.include?(user)
      end

      can :create, Channel do |c|
        user.teams.include?(c.team) ||
        c.team.users.include?(user)
      end

      can :destroy, Channel do |c|
        c.team.user == user ||
        c.user == user
      end
    end
  end
end
