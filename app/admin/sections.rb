ActiveAdmin.register Section do

  permit_params :name, :order, :restaurant_id

  index do
    selectable_column
    column :name
    column :order
    column :restaurant
    actions
  end

  config.sort_order = 'order_asc'

  form partial: 'form'

  menu label: "Menu Sections"
  controller do
    before_action { @page_title = "Menu Sections" }
  end
  
end
