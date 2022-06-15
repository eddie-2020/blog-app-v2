class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :create, :all
    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    can :manage, Like, author_id: user.id
    # can :read, Post, user: user
    return unless user.is?(:admin) # additional permissions for administrators

    can :manage, :all
  end
end
