ActiveAdmin.register Section do
  permit_params :name, :order, :restaurant_id

  belongs_to :restaurant, optional: true
  config.clear_action_items!

  show do
    attributes_table do
      row :restaurant
      row :name
      row :order
    end

    panel "Menu items in #{resource.name}" do
      table_for(resource.menu_items) do
        column :name
        column :description
        column :is_active
        column :price do |item|
          number_to_currency(to_pounds(item.price), unit: "£")
        end
        column("Actions") do |item|
          span link_to "View", admin_menu_item_path(item)
          span link_to "Edit", edit_admin_menu_item_path(item)
          if !item.order_items.present?
            span link_to "Delete", admin_menu_item_path(item), method: :delete
          end
        end
      end
    end
  end

  controller do
    def destroy
      resource.destroy
      if resource.errors.any?
        flash[:error] = "Delete the menu items first."
      else
        flash[:notice] = "Success"
      end
      redirect_to admin_sections_path
    end
  end

  batch_action :destroy do |selection|
    Section.find(selection).each do |r|
      r.destroy
      if r.errors.any?
        flash[:error] = "Delete the menu items first."
      else
        flash[:notice] = "The items have been deleted"
      end
    end

    redirect_to collection_path
  end

  action_item :new, only: :show do
    link_to "Create new menu item", new_admin_section_menu_item_path(resource)
  end

  index do
    selectable_column
    column :restaurant if current_admin_user.role == "admin"
    column :name
    column "Order in the menu", :order
    actions
  end

  config.sort_order = "restaurant_id_asc"

  form partial: "form"
  menu label: "Menu Sections"

  filter :restaurant
  filter :name
  filter :order, label: "Order in the menu"
end
