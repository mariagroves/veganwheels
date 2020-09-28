ActiveAdmin.register MenuItem do
  permit_params :name, :price, :description, :is_active, :restaurant_id, :section_id

  belongs_to :section, optional: true

  config.clear_action_items!
  
  index do
    selectable_column
    column :name
    column :price do |item|
      number_to_currency(to_pounds(item.price), unit: "£")
    end
    column :description
    column :is_active
    column :restaurant if current_admin_user.role == 'admin'
    column "Menu section", :section
    actions
  end

  show do
    attributes_table do
      row :restaurant
      row :name
      row :price do |item|
        number_to_currency(to_pounds(item.price), unit: "£")
      end
      row :description
      row :is_active
      row :section
    end

    panel "Sides" do
      table_for(resource.menu_options) do
        column :name
        column :description
        column :price do |item|
          number_to_currency(to_pounds(item.price), unit: "£")
        end
        column("Actions") do |side|
          span link_to "View", admin_menu_option_path(side)
          span link_to "Edit", edit_admin_menu_option_path(side)
          span link_to "Delete", admin_menu_option_path(side), method: :delete
        end
      end
    end
  end

  action_item :new, only: :show do
    link_to 'Create new side', new_admin_menu_item_menu_option_path(resource)
  end

  menu label: "Menu Items"
  
  controller do
    before_action { @page_title = "Menu Items" }
  end

  form partial: 'form'

  filter :restaurant
  filter :name
  filter :description
  filter :price, label: "Price in pence"
  filter :is_active

end
