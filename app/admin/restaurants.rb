ActiveAdmin.register Restaurant do

  permit_params :name, :street_address, :city, :county, :postcode, :about, :phone, :email, :latitude, :longitude, :imagekey, :website, :photo, :admin_user_id, :is_open, :monday_opens_at, :monday_closes_at, :tuesday_opens_at, :tuesday_closes_at,:wednesday_opens_at, :wednesday_closes_at, :thursday_opens_at, :thursday_closes_at, :friday_opens_at, :friday_closes_at,:saturday_opens_at, :saturday_closes_at, :sunday_opens_at,:sunday_closes_at
 
  filter :name
  filter :email
  filter :is_open
 
  index do
    column :name
    column :address
    column :admin_user if current_admin_user.role == "admin"
    column :about
    column :website
    column :email
    column :phone
    column :opening_hours
    column :is_open
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
      row :opening_hours
      row :address
      row :phone
      row :email
      row :website
      row :is_open
      row :photo do |restaurant|
        image_tag url_for(restaurant.photo)
      end
    end

    panel "Menu Sections for #{resource.name}" do
      table_for(resource.sections) do
        column :name
        column :order
        column("Actions") do |section|
          span link_to "View", admin_section_path(section)
          span link_to "Edit", edit_admin_section_path(section)
          span link_to "Delete", admin_section_path(section), method: :delete
        end
      end
    end
  end

  action_item :new, only: :show do
    link_to 'Create new menu section', new_admin_restaurant_section_path(resource)
  end

end
