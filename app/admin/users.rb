ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :phone, :flat, :street_address, :city, :county, :postcode

  config.clear_action_items!
  menu label: "Customers"
  controller do
    before_action { @page_title = "Customers" }
  end

  config.batch_actions = false

  index do
    column :email
    column :first_name
    column :last_name
    column :phone
    column :flat
    column :street_address
    column :city
    column :county
    column :postcode
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :phone
  filter :street_address
  filter :city
  filter :county
  filter :postcode

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :phone
      row :flat
      row :street_address
      row :city
      row :county
      row :postcode
    end

    panel "Orders" do
      table_for(resource.orders) do
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
        column :open
        column :order_time
        column("Actions") do |side|
          span link_to "View", admin_order_path(side)
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :phone
      f.input :flat
      f.input :street_address
      f.input :city
      f.input :county
      f.input :postcode
    end
    f.actions
  end
end
