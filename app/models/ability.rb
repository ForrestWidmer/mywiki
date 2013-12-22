class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

   
    if user.status? :free
      can :manage, Wiki
      can :manage, Discussion, :user_id => user.id
    end
    
    if user.status? :paid
      can :manage, Wiki
      can :manage, Discussion, :user_id => user.id
    end  

    if user.status? :admin
      can :manage, :all
    end

    can :read, Wiki, public: true
    can :read, Discussion
    can :read, Category
  end
end