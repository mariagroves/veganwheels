ActiveAdmin.register MenuItem do

  permit_params :name, :price, :description, :is_active, :restaurant_id, :section_id

  index do
    selectable_column
    column :name
    column :price do |item|
      number_to_currency(to_pounds(item.price), unit: "£")
    end
    column :description
    column :is_active
    column :restaurant
    column "Menu section", :section
    actions
  end
  
  menu label: "Main menu"
  controller do
    before_action { @page_title = "Main menu" }
  end

  form partial: 'form'

  filter :restaurant, collection: proc { Restaurant.where(admin_user_id: current_admin_user) }
  filter :section, collection: proc { Section.where(restaurant_id: current_admin_user.restaurants.each {|r| r.id}) }, label: "Menu section"
  filter :name
  filter :description
  filter :price, label: "Price in pence"
  filter :is_active

end
