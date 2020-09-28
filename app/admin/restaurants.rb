ActiveAdmin.register Restaurant do

  permit_params :name, :address, :open_time, :close_time, :about, :phone, :email, :latitude, :longitude, :imagekey, :website, :photo, :admin_user_id

  sidebar "Menu Sections", only: [:show] do
    li link_to "See Menu Sections",    admin_restaurant_sections_path(resource)
    li link_to "Create New Section",    new_admin_restaurant_section_path(resource)
  end
 
  filter :name
  filter :email
 
  index do
    column :name
    column :address
    column :admin_user if current_admin_user.role == "admin"
    column :about
    column :website
    column :email
    column :phone
    column "Opening time", :open_time
    column "Closing time", :close_time
    actions
  end

  menu label: "Restaurant Information"
  controller do
    before_action { @page_title = "Restaurant Information" }
  end

  form partial: 'form'

  show do
    attributes_table do
      row :admin_user
      row :name
      row :about
      row :address
      row :phone
      row :email
      row :website
      row :open_time
      row :close_time
      row :photo do |restaurant|
        image_tag url_for(restaurant.photo)
      end
    end
  end

end
