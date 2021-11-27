# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can [:create, :read], Review, is_live: true
    #can :read, Review, is_live: true
    can :create, Register

    return unless user.present?
    return unless user.internal?

    if user.is? :reporter
      can :read , Register
    end

    return unless user.is? :product_owner

    if user.is? :product_owner
      can [:read, :update], Review
      can [:read], Register
    end

    return unless user.is? :admin
    if user.is? :admin
      can :manage, User
      cannot :destroy, User, id: user.id

      can :manage, Role
      #cannot :destroy, Role, role_type: :admin

      can :manage, UserRole
      #cannot :manage, UserRole, user_id: user.id
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
