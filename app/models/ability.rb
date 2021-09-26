# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == "admin"
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :manage, AdminUser
      can :read, Business
      can :create, Business
      can :update, Business
      can :manage, User
      can :manage, Delivery
      can :read, MenuItem
      can :create, MenuItem
      can :update, MenuItem
      can :read, MenuOption
      can :create, MenuOption
      can :update, MenuOption
      can :manage, Section
      can :read, Order
      can :update, Order
      can :destroy, Order
      can :manage, Restaurant
      can :manage, RiderUser
      can :manage, WorkArea
      can :manage, RiderWorkArea
      MenuItem.all.each do |menu_item|
        can :destroy, MenuItem, id: menu_item.id if !menu_item.order_items.present?
      end
      MenuOption.all.each do |menu_option|
        can :destroy, MenuOption, id: menu_option.id if !menu_option.order_item_options.present?
      end
    elsif user.role == "rider" && !user.is_active
      can :read, ActiveAdmin::Page, name: "Dashboard"
    elsif user.role == "rider" && user.is_active
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, Order, is_assigned: false, open: true, state: "paid"
      can :read, RiderUser, id: user.id
      can :update, RiderUser, id: user.id
      can :read, Delivery, rider_user_id: user.id
      can :destroy, Delivery, rider_user_id: user.id
      can :create, RiderWorkArea
      can :manage, RiderWorkArea, rider_user_id: user.id
    elsif user.role == "restaurant"
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, AdminUser, id: user.id
      can :read, Restaurant, admin_user_id: user.id
      can :read, MenuItem, restaurant_id: user.restaurant.id
      can :read, Order, restaurant_id: user.restaurant.id, state: "paid"
      can :update, AdminUser, id: user.id
      can :update, MenuItem, restaurant_id: user.restaurant.id
      can :update, Restaurant, admin_user_id: user.id
      can :manage, Section, restaurant_id: user.restaurant.id
      user.restaurant.menu_items.each do |menu_item|
        can :read, MenuOption, menu_item_id: menu_item.id
        can :update, MenuOption, menu_item_id: menu_item.id
        can :create, MenuOption, menu_item_id: menu_item.id
        can :destroy, MenuItem, id: menu_item.id if !menu_item.order_items.present?

        menu_item.menu_options.each do |menu_option|
          can :destroy, MenuOption, id: menu_option.id if !menu_option.order_item_options.present?
        end
      end
      can :create, Section
      can :create, MenuItem
      can :create, MenuOption
    end
  end
end
