# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
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

    if user.owner?
        can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
        can :create, Menu
        can [:read, :update, :destroy], Menu, admin_user: { id: user.id }

        can :create, Section
        can [:read, :update, :destroy], Section, menu: { admin_user: { id: user.id }}

        can :create, Product
        can [:read, :update, :destroy], Product, section: { menu: { admin_user: { id: user.id }}}

        can :create, Waiter
        can [:read, :update, :destroy], Waiter, menu: { admin_user: { id: user.id }}

        can :create, MediaFile
        can [:read, :update, :destroy], MediaFile, product: { section: { menu: { admin_user: { id: user.id }}}}


        can :read, Suggestion, menu: { admin_user: { id: user.id }}

        can :read, Calification, menu: { admin_user: { id: user.id }}

    end
  end
end
