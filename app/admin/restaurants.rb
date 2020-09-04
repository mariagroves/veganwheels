ActiveAdmin.register Restaurant do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :address, :open_time, :close_time, :about, :phone, :email, :latitude, :longitude, :imagekey, :website

  index do
    selectable_column
    column :name
    column :address
    column :website
    column :email
    column :phone
    column :open_time
    column :close_time
    column :about
    actions
  end
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :open_time, :close_time, :about, :phone, :email, :latitude, :longitude, :imagekey, :website]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
