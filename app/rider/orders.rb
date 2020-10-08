ActiveAdmin.register Order, namespace: :rider do

  config.clear_action_items!
  config.filters = false
  config.batch_actions = false
  menu label: "Available Deliveries"
  controller do
    before_action { @page_title = "Available Deliveries" }
  end

  index do
    selectable_column
    column "Order no", :id
    column :restaurant
    column "Restaurant Address", :id do |order|
      link_to order.restaurant.address, "https://www.google.com/maps/search/?api=1&query=#{CGI.escape(order.user.address)}", target: "_blank"
    end
    column "Delivery Address", :id do |order|
      link_to order.user.address, "https://www.google.com/maps/search/?api=1&query=#{CGI.escape(order.user.address)}", target: "_blank"
    end
    column "Time order placed", :order_time
    column do |order|
      active_admin_form_for order, url: sign_up_for_job_rider_order_path(order), method: :post do |f|
        f.inputs do 
          f.input :order_id, input_html: { :value => order.id }, as: :hidden
          f.input :rider_user_id, input_html: { :value => current_rider_user.id }, as: :hidden
        end
         f.action :submit, label: "Sign up for job"
      end
    end
    actions
  end

  member_action :sign_up_for_job, method: [:post, :patch] do
    order = params[:order][:order_id]
    rider = params[:order][:rider_user_id]
    if !current_rider_user.is_available
      flash[:error] = "Please set yourself as available for deliveries on your profile before signing up."
      redirect_to rider_orders_path
    else
      Delivery.create!(order_id: order, rider_user_id: rider)
      flash[:notice] = "A new delivery was successfully created."
      redirect_to rider_deliveries_path
    end
  end

  show do
    attributes_table do
      row "Order no" do
        resource.id
      end
      row :restaurant
      row "Restaurant Address" do
        link_to resource.restaurant.address, "https://www.google.com/maps/search/?api=1&query=#{CGI.escape(order.user.address)}", target: "_blank"
      end
      row :order_time
    end

    panel "Customer Details" do
      table_for(resource.user) do
        column :name
        column :phone
        column "Delivery Address", :address do |user|
          link_to user.address, "https://www.google.com/maps/search/?api=1&query=#{CGI.escape(user.address)}", target: "_blank"
        end
        column "Delivery Instructions" do 
          resource.delivery_instructions
        end
      end
    end

    panel "Menu items" do
      table_for(resource.cart.order_items) do
        column :name
        column :quantity
        column :note
      end
    end

    resource.cart.order_items.each do |order_item|
      if order_item.has_side
      panel "Sides for #{order_item.name}" do
        table_for(order_item.order_item_options) do
          column :name
          column :quantity
        end
      end
      end
    end
  end
end
