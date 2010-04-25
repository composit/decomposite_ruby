class Ability
  include CanCan::Ability

  def initialize( user )
    can :read, :all
    can :create, Post do |post|
      post.user_id = user.id
    end
    can :manage, User, :id => user.id
  end
end
