ActiveAdmin.register MenuOption do
  permit_params :name, :description, :price, :menu_item_id
 
  index do
    selectable_column
    column :name
    column :price do |item|
      number_to_currency(to_pounds(item.price), unit: "£")
    end
    column :description
    column "Side for menu item", :menu_item
    column :restaurant do |item|
      item.menu_item.restaurant
    end
    actions
  end
  menu label: "Sides menu"
  controller do
    before_action { @page_title = "Sides menu" }
  end
  form partial: 'form'
end
