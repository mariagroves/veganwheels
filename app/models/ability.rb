# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new

    if user.role == 'admin'
      can :manage, :all
    elsif  user.role == 'restaurant'
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, Restaurant, admin_user_id: user.id
      can :update, Restaurant, admin_user_id: user.id
      user.restaurants.each do |restaurant|
        can :manage, Section, restaurant_id: restaurant.id
        can :manage, MenuItem, restaurant_id: restaurant.id
        restaurant.menu_items.each do |menu_item|
          can :manage, MenuOption, menu_item_id: menu_item.id
        end
      end
      can :create, Section
      can :create, MenuItem
      can :create, MenuOption
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
