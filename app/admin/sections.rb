ActiveAdmin.register Section do
  permit_params :name, :order, :restaurant_id

  belongs_to :restaurant, optional: true

  sidebar "Menu Items", only: [:show] do
    li link_to "See Menu Items",    admin_section_menu_items_path(resource)
    li link_to "Create New Menu Item",     new_admin_section_menu_item_path(resource)
  end
  

  index do
    selectable_column
    column :restaurant if current_admin_user.role == 'admin'
    column :name
    column "Order in the menu", :order
    actions
  end

  config.sort_order = 'restaurant_id_asc'
  config.clear_action_items!

  form partial: 'form'
  menu label: "Menu Sections"

  filter :restaurant
  filter :name
  filter :order, label: "Order in the menu"

end
