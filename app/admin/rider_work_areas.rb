ActiveAdmin.register RiderWorkArea do
  permit_params :work_area_id, :rider_user_id

  index do
    selectable_column
    column :work_area
    column "Rider Name", :rider_user
    actions
  end

  filter :work_area
  filter :rider_user

  show do
    attributes_table do
      row :work_area
      row :rider_user
    end
  end
 
end
