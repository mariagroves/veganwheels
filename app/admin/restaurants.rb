ActiveAdmin.register Restaurant do
  
  permit_params :name, :address, :open_time, :close_time, :about, :phone, :email, :latitude, :longitude, :imagekey, :website

  index do
    selectable_column
    column :name
    column :address
    column :website
    column :email
    column :phone
    column "Opening time", :open_time
    column "Closing time", :close_time
    column :about
    actions
  end

  
end
