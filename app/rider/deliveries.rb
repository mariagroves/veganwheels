ActiveAdmin.register Delivery, namespace: :rider do
  belongs_to :order, optional: true
  config.clear_action_items!
  config.filters = false
  config.batch_actions = false
  config.sort_order = "is_delivered_asc"
  menu label: "My Deliveries"
  controller do
    before_action { @page_title = "My Deliveries" }
  end

  controller do
    def destroy
      @delivery = Delivery.find(params[:id])
      if Time.current - @delivery.created_at > 5.minutes
        flash[:error] = "You cannot cancel this delivery as more than 5 minutes has passed since you signed up."
        redirect_to rider_deliveries_path
        return
      else
        @delivery.destroy
        redirect_to rider_deliveries_path
      end
    end
  end

  index do
    column "Order", :id do |del|
      del.order.id
    end
    column "Restaurant", :id do |del|
      del.order.restaurant.name
    end
    column "Restaurant Address", :id do |del|
      link_to del.order.restaurant.address, "https://www.google.com/maps/search/?api=1&query=#{CGI.escape(del.order.restaurant.address)}", target: "_blank"
    end
    column "Delivery Address", :id do |del|
      link_to del.order.user.address, "https://www.google.com/maps/search/?api=1&query=#{CGI.escape(del.order.user.geocoder_address)}", target: "_blank"
    end
    column "Collected", :is_collected
    column :time_collected
    column do |del|
      active_admin_form_for del, url: toggle_collected_rider_delivery_path(del), method: :patch do |f|
        f.inputs do
          f.input :is_collected, input_html: { :value => del.is_collected }, as: :hidden
        end
        f.action :submit, label: del.is_collected ? "Mark Uncollected" : "Mark Collected"
      end
    end
    column "Delivered", :is_delivered
    column :time_delivered
    column do |del|
      active_admin_form_for del, url: toggle_delivered_rider_delivery_path(del), method: :patch do |f|
        f.inputs do
          f.input :is_delivered, input_html: { :value => del.is_delivered }, as: :hidden
        end
        f.action :submit, label: del.is_delivered ? "Mark Not Delivered" : "Mark Delivered"
      end
    end
    actions
  end

  member_action :toggle_collected, method: [:post, :patch] do
    delivery = Delivery.find(params[:id])
    if delivery.is_delivered && delivery.is_collected
      flash[:error] = "Please mark the order as not delivered first."
    elsif delivery.is_collected
      delivery.update(is_collected: false)
    else
      delivery.update(is_collected: true)
    end
    redirect_to rider_deliveries_path
  end

  member_action :toggle_delivered, method: [:post, :patch] do
    delivery = Delivery.find(params[:id])
    flash[:error] = "Please mark the order as collected first." if !delivery.is_collected
    if delivery.is_delivered && Time.current - delivery.updated_at > 5.minutes
      flash[:error] = "You cannot mark this order as not delivered as more than 5 minutes have passed since you marked it as delivered."
    elsif delivery.is_delivered
      delivery.update(is_delivered: false)
    else
      delivery.update(is_delivered: true) if delivery.is_collected
    end
    redirect_to rider_deliveries_path
  end

  show do
    attributes_table do
      row "Order no" do
        resource.order.id
      end
      row "Restaurant" do
        resource.order.restaurant.name
      end
      row "Restaurant Phone" do
        resource.order.restaurant.phone
      end
      row "Restaurant Address" do
        link_to resource.order.restaurant.address, "https://www.google.com/maps/search/?api=1&query=#{CGI.escape(resource.order.user.address)}", target: "_blank"
      end
      row "Collected" do
        resource.is_collected
      end
      row :time_collected
      row "Delivered" do
        resource.is_delivered
      end
      row :time_delivered
    end

    panel "Customer Details" do
      table_for(resource.order.user) do
        column :name
        column :phone
        column "Delivery Address", :address do |user|
          link_to user.address, "https://www.google.com/maps/search/?api=1&query=#{CGI.escape(user.geocoder_address)}", target: "_blank"
        end
        column "Delivery Instructions" do
          resource.order.delivery_instructions
        end
      end
    end

    panel "Menu items" do
      table_for(resource.order.cart.order_items) do
        column :name
        column :quantity
        column :note
      end
    end

    resource.order.cart.order_items.each do |order_item|
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
