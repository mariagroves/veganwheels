ActiveAdmin.register Cart do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params 
  #
  # or
  #
  # permit_params do
  #   permitted = []
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  menu false
  sidebar "See details of order", only: [:show] do
    li link_to "See mains",     admin_cart_order_items_path(resource)
  end
  show do
    attributes_table do
      row :order_item
    end
  end
  
end
