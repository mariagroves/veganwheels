ActiveAdmin.register Order do

#  should the admin be able to change stuff?
  permit_params :checkout_session_id, :user_id, :cart_id, :order_price, :total_price, :is_assigned, :state, :delivery_price, :open, :order_time

  config.clear_action_items!

  index do
    selectable_column
    column :cart
    column :user
    column :restaurant
    column :order_price do |item|
      number_to_currency(to_pounds(item.order_price), unit: "£")
    end
    column :delivery_price do |item|
      number_to_currency(to_pounds(item.delivery_price), unit: "£")
    end
    column :total_price do |item|
      number_to_currency(to_pounds(item.total_price), unit: "£")
    end
    column :is_assigned
    column :state
    column :open
    column :order_time
    actions
  end

  show do
    attributes_table do
      row :cart
      row :user
      row :restaurant
      row :order_price do |item|
        number_to_currency(to_pounds(item.order_price), unit: "£")
      end
      row :delivery_price do |item|
        number_to_currency(to_pounds(item.delivery_price), unit: "£")
      end
      row :total_price do |item|
        number_to_currency(to_pounds(item.total_price), unit: "£")
      end
      row :is_assigned
      row :state
      row :open
      row :order_time
    end

    panel "User Details" do
      table_for(resource.user) do
        column :name
        column :phone
        column :email
        column :address
      end
    end

    panel "Items" do
      table_for(resource.cart.order_items) do
        column :name
        column :quantity
        column :note
        column :unit_price do |item|
          number_to_currency(to_pounds(item.unit_price), unit: "£")
        end
        column :total_price do |item|
          number_to_currency(to_pounds(item.total_price), unit: "£")
        end
      end
    end
    resource.cart.order_items.each do |order_item|
      if order_item.has_side
      panel "Sides for #{order_item.name}" do
        table_for(order_item.order_item_options) do
          column :name
          column :quantity
          column :unit_price do |item|
            number_to_currency(to_pounds(item.unit_price), unit: "£")
          end
          column :total_price do |item|
            number_to_currency(to_pounds(item.total_price), unit: "£")
          end
        end
      end
      end
    end
  end

  filter :user
  filter :restaurant
  filter :order_price
  filter :total_price
  filter :is_assigned
  filter :state
  filter :open
  filter :order_time

end
