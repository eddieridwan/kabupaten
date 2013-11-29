class Ability
  include CanCan::Ability

  def initialize(current_user)
    # Define abilities for the passed in user here. For example:
    #
      # user ||= User.new # guest user (not logged in)
      # if user.has_role? :admin
      #   can :manage, :all
      # else
      #   can :read, Article
      # end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

    current_user ||= User.new # guest user (not logged in)
    set_guest_permissions # default permissions

    current_user.roles.each do |role|
      can [:show, :update], current_user  # only view and update their own and can't view the list of users
      send("set_#{role.name.gsub(' ','_')}_permissions", current_user)
    end

  end

  private

  # Not logged in
  def set_guest_permissions
    can :read, [Kabupaten, Province, Project, Snippet]
    can :show, User
  end

  def set_admin_permissions(current_user)
    can :manage, [Kabupaten, Province, Project, Snippet, User]
  end

  def set_contributor_permissions(current_user)
    can :read, Snippet
    can :update, [Kabupaten, Province]
    can :create, Project
    can :update, Project do |project|
      project.user == current_user
    end
    can :update, User do |user|
      user == current_user
    end
  end
end
