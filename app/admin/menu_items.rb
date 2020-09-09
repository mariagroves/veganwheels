ActiveAdmin.register MenuItem do
  permit_params :name, :price, :description, :is_active, :restaurant_id, :section_id

  belongs_to :section, optional: true
    
  sidebar "Sides", only: [:show] do
    li link_to "See Sides",    admin_menu_item_menu_options_path(resource)
    li link_to "Create New Side",    new_admin_menu_item_menu_option_path(resource)
  end

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
  end

  menu label: "Menu Items"
  
  controller do
    before_action { @page_title = "Menu Items" }
  end

  form partial: 'form'

  # unless proc{ current_admin_user.role } == 'admin'
    # filter :section, collection: proc { Section.where(restaurant_id: current_admin_user.restaurant) }, label: "Menu section"
    
  # end

  filter :restaurant
  filter :name
  filter :description
  filter :price, label: "Price in pence"
  filter :is_active

end
