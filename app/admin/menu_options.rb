ActiveAdmin.register MenuOption do
  permit_params :name, :description, :price, :menu_item_id

  belongs_to :menu_item, optional: true
  
  config.clear_action_items!

  index do
    selectable_column
    column :restaurant if current_admin_user.role == 'admin' 
    column :name
    column :price do |item|
      number_to_currency(to_pounds(item.price), unit: "£")
    end
    column :description
    column "Side for menu item", :menu_item
    actions
  end

  show do
    attributes_table do
      row :name
      row :price do |item|
        number_to_currency(to_pounds(item.price), unit: "£")
      end
      row :description
      row :menu_item
    end
  end


  menu label: "Menu Sides"
  controller do
    before_action { @page_title = "Menu Sides" }
  end

  form partial: 'form'

  filter :restaurant
  filter :name
  filter :description
  filter :price, label: "Price in pence"

end
