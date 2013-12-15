class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    # if a member, they can manage their own posts 
    # (or create new ones)
    if user.role? :member
      can :manage, Wiki#, Wiki.all do |w|
        #w.users.include? current_user
      #end  #, :user_id => user.collaborations.id
      can :manage, Discussion, :user_id => user.id
    end
    #if user.collaborations.role?(wiki_id)
    # Moderators can delete any post
    #end
    if user.role? :moderator
      can :destroy, Wiki
      can :destroy, Discussion
      can :manage, Category
    end
    # Paid users can make wikis private and add collaborators
    if user.role? :paid
      can :destroy, Wiki
      can :destroy, Discussion
      can :read, Wiki, public: false
      can :manage, Collaboration
    end  
    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, Wiki, public: true
    can :read, Discussion
    can :read, Category
  end
end