ActiveAdmin.register RiderWorkArea do
  permit_params :work_area_id, :rider_user_id

  config.batch_actions = false

  index do
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

  controller do
    def destroy
      if resource.rider_user.is_available
        flash[:error] = "The rider is set to available. To delete the rider work area, first set the rider to unavailable."
        redirect_to admin_rider_work_areas_path
      else
        resource.destroy
        flash[:notice] = "Rider work area was successfully deleted."
        redirect_to admin_rider_work_areas_path
      end
    end
  end
end
