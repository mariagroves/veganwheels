ActiveAdmin.register RiderUser do

  permit_params :email, :password, :password_confirmation, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :is_available, :is_active, :phone, :role

  menu label: "Riders"
  controller do
    before_action { @page_title = "Riders" }
  end

  index do
    column :name
    column :email
    column "Available to work", :is_available
    column "Active on VeganWheels",  :is_active
    column :phone
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :phone
      row "Available to work" do
        resource.is_available
      end
      row "Active on VeganWheels" do
        resource.is_active
      end
    end

    if resource.deliveries.present?
      panel "Deliveries for #{resource.name}" do
        table_for(resource.deliveries) do
          column :order
          column "Collected from Restaurant", :is_collected
          column "Delivered To Customer", :is_delivered
          column :time_collected
          column :time_delivered
        end
      end
    end
  end

  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end

  form title: 'Edit Rider Details' do |f|
    inputs 'Details' do
      input :first_name
      input :last_name
      input :email
      input :phone
      input :is_active, label: "Active on VeganWheels"
      input :is_available, label: "Available To Work"
      input :password
      input :password_confirmation
    end
    actions
  end

  filter :first_name
  filter :last_name
  filter :is_available, label: "Active on VeganWheels"
  filter :is_active, label: "Available To Work"
  
end
