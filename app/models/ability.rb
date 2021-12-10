# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can %i[create read], Review, is_live: true
    # can :read, Review, is_live: true
    can :create, Register
    can %i[create read], Question, is_live: true
    can :update, Review, :likes

    return if user.blank?
    return unless user.internal?

    if user.is? :reporter
      can :read, Register
      # set_live
      cannot %i[create destroy], Review
      cannot :manage, UserRole
      cannot :manage, User
      cannot :manage, Role
      cannot :manage, Question
      cannot :manage, Answer

    end

    return unless user.is?(:product_owner) || user.is?(:admin)

    if user.is? :product_owner
      # set_live
      can %i[read update], Review, :all
      cannot %i[create destroy], Review

      can :manage, Question
      can :manage, Answer
      can [:read], Register

      cannot :destroy, Question
      cannot :manage, UserRole
      cannot :manage, User
      cannot :manage, Role
    end

    return unless user.is? :admin

    if user.is? :admin
      cannot %i[create destroy], Review
      unless user.is? :product_owner
        cannot :manage, Question
        cannot :manage, Answer
        cannot :update, Review
      end

      can :manage, User
      cannot :destroy, User, id: user.id

      can :manage, Role
      # cannot delete the user roles owned by the any particular user
      cannot :destroy, Role do |role|
        role.user_roles.size.positive?
      end

      can :manage, UserRole
      # cannot :manage, UserRole, user_id: user.id
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
