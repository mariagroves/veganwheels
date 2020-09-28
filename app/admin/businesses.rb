ActiveAdmin.register Business do
  permit_params :delivery_price
  config.filters = false
  config.clear_action_items!
  menu label: "Business Information"

  index do
    column :delivery_price do |item|
      number_to_currency(to_pounds(item.delivery_price), unit: "£")
    end
    actions
  end

  controller do
    before_action { @page_title = "Business Information" }
  end
  
end
