ActiveAdmin.register OrderItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :menu_item_id, :quantity, :note, :unit_price, :total_price, :cart_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:menu_item_id, :quantity, :note, :unit_price, :total_price, :cart_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  belongs_to :cart, optional: true
  sidebar "See side", only: [:show] do
    li link_to "See added side",     admin_order_item_order_item_options_path(resource)
  end

  index do
    selectable_column
    column :name
    column :quantity
    column :note
    column :unit_price do |item|
      number_to_currency(to_pounds(item.unit_price), unit: "£")
    end
    column :total_price do |item|
      number_to_currency(to_pounds(item.total_price), unit: "£")
    end
    column :has_side
    actions
  end

  show do
    attributes_table do
      row :name
      row :quantity
      row :note
      row :unit_price do |item|
        number_to_currency(to_pounds(item.unit_price), unit: "£")
      end
      row :total_price do |item|
        number_to_currency(to_pounds(item.total_price), unit: "£")
      end
      row :has_side
    end
  end

  config.filters = false
  config.clear_action_items!
  menu false
end
