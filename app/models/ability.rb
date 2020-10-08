# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'rider' && !user.is_active
      can :read, ActiveAdmin::Page, name: "Dashboard"
    elsif user.role == 'rider' && user.is_active
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, Order, is_assigned: false, open: true, state: "paid"
      can :read, RiderUser, id: user.id
      can :update, RiderUser, id: user.id
      can :read, Delivery, rider_user_id: user.id
      can :destroy, Delivery, rider_user_id: user.id
    elsif  user.role == 'restaurant'
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, Restaurant, admin_user_id: user.id
      can :update, Restaurant, admin_user_id: user.id
      can :manage, Section, restaurant_id: user.restaurant.id
      can :manage, MenuItem, restaurant_id: user.restaurant.id
      user.restaurant.menu_items.each do |menu_item|
        can :manage, MenuOption, menu_item_id: menu_item.id
      end
      can :create, Section
      can :create, MenuItem
      can :create, MenuOption
      can :read, Order, restaurant_id: user.restaurant.id
    end
  end
end
