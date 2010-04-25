class Ability
  include CanCan::Ability

  def initialize( user )
    user ||= User.new # guest user

    can :create, Post, :user_id => user.id
    can :new, Post
    can :manage, User, :id => user.id
    can :read, :all
  end
end
