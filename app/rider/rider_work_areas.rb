ActiveAdmin.register RiderWorkArea, namespace: :rider  do
  permit_params :rider_user_id, :work_area_id

  index do
      selectable_column
      column :work_area
      actions
    end
  
    filter :work_area
  
    show do
      attributes_table do
        row :work_area
      end
    end

    form partial: 'form'

    controller do
      def destroy
        if resource.rider_user.is_available
          flash[:error] = "The rider is set to available. To delete the rider work area, first set the rider to unavailable."
          redirect_to rider_rider_work_areas_path
        else 
          resource.destroy
          flash[:notice] = "Rider work area was successfully deleted."
          redirect_to rider_rider_work_areas_path
        end
      end
    end
end