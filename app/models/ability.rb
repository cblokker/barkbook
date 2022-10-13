# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can [:index, :show, :new, :create, :destroy], Dog
    can :update, Dog, user: user
  end
end
