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

end