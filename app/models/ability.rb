class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

   
    if user.status? :free
      can :manage, Wiki, :user_id => user.id
      can :manage, Discussion, :user_id => user.id
      can :edit, Wiki, user.roles.where(wiki_id:wiki.id,level:'editor').length > 0

    end
    
    if user.status? :paid
      can :manage, Wiki, :user_id => user.id
      can :manage, Discussion, :user_id => user.id
      can :manage, Wiki, user.roles.where(wiki_id:wiki.id,level:'owner').length > 0
    end  

    if user.status? :admin
      can :manage, :all
    end

    can :read, Wiki, public: true
    can :read, Discussion
    can :read, Category
  end
end