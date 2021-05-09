ActiveAdmin.register Delivery do
  permit_params :order_id, :rider_user_id, :is_collected, :is_delivered, :time_collected, :time_delivered

  config.batch_actions = false

  index do
    column :order
    column "Rider", :rider_user
    column "Collected from Restaurant", :is_collected
    column "Delivered To Customer", :is_delivered
    column :time_collected
    column :time_delivered
    actions
  end

  show do
    attributes_table do
      row :order
      row "Rider" do
        resource.rider_user
      end
      row "Collected From Restaurant" do
        resource.is_collected
      end
      row "Delivered To Customer" do
        resource.is_delivered
      end
      row :time_collected
      row :time_delivered
    end
  end

  form do |f|
    inputs "Delivery" do
      input :rider_user, label: "Rider"
      input :order_id, as: :number
      input :is_collected, label: "Collected From Restaurant"
      input :is_delivered, label: "Delivered To Customer"
    end
    actions
  end

  filter :rider_user, label: "Rider"
  filter :order_id, as: :number
  filter :is_collected, label: "Collected From Restaurant"
  filter :is_delivered, label: "Delivered To Customer"
end
