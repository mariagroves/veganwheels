ActiveAdmin.register MenuItem do

  permit_params :name, :price, :description, :is_active, :restaurant_id, :section_id

  index do
    selectable_column
    column :name
    column :price
    column :description
    column :is_active
    column :restaurant
    column :section
    actions
  end
  menu label: "Menu"
  controller do
    before_action { @page_title = "Menu" }
  end
end
