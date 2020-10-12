ActiveAdmin.register Restaurant do

  permit_params :name, :street_address, :city, :county, :postcode, :about, :phone, :email, :latitude, :longitude, :imagekey, :website, :photo, :admin_user_id, :is_open, :monday_opens_at, :monday_closes_at, :tuesday_opens_at, :tuesday_closes_at,:wednesday_opens_at, :wednesday_closes_at, :thursday_opens_at, :thursday_closes_at, :friday_opens_at, :friday_closes_at,:saturday_opens_at, :saturday_closes_at, :sunday_opens_at,:sunday_closes_at

  config.batch_actions = false

  after_create do |restaurant|
    restaurant.update(imagekey: rand(1..4))
  end
 
  filter :name
  filter :email
  filter :is_open
 
  index do
    column :name
    if current_admin_user.role == "restaurant" && !current_admin_user.restaurant.is_onboarded
      column do |restaurant|
        active_admin_form_for restaurant, url: stripe_connect_admin_restaurant_path(restaurant), method: :post do |f|
          f.inputs do 
            f.input :restaurant_id, input_html: { :value => restaurant.id }, as: :hidden
          end
          f.action :submit, label: "Connect To Stripe"
        end
      end
    end
    column :address
    column :admin_user if current_admin_user.role == "admin"
    column :about
    column :website
    column :email
    column :phone
    column "Open", :is_open
    column "Stripe Account", :is_onboarded
    actions
  end

  member_action :stripe_connect, method: [:post, :patch] do
    restaurant = Restaurant.find(params[:id])
  
    if restaurant.stripe_account_id.nil? || restaurant.stripe_account_id.empty?
      account = Stripe::Account.create({
        type: 'standard',
        capabilities: {
          card_payments: {requested: true},
          transfers: {requested: true}
        }
      })
      restaurant.update(stripe_account_id: account.id)
    end
    account_links = Stripe::AccountLink.create({
      account: restaurant.stripe_account_id,
      refresh_url: stripe_connect_admin_restaurant_url(restaurant),
      return_url: admin_restaurants_url,
      type: 'account_onboarding',
    })
    redirect_to account_links.url
  end

  menu label: "Restaurant Information"
  controller do
    before_action { @page_title = "Restaurant Information" }
    before_action :set_notice, only: :index

    private

    def set_notice
      flash.now[:error] = 'Please complete Stripe onboarding.' if current_admin_user.role == "restaurant" && !current_admin_user.restaurant.is_onboarded
    end
  end

  form partial: 'form'

  show do
    attributes_table do
      row :admin_user
      row :name
      row :about
      row :opening_hours
      row :address
      row :phone
      row :email
      row :website
      row :is_open
      row :photo do |restaurant|
        image_tag url_for(restaurant.photo)
      end
    end

    panel "Menu Sections for #{resource.name}" do
      table_for(resource.sections) do
        column :name
        column :order
        column("Actions") do |section|
          span link_to "View", admin_section_path(section)
          span link_to "Edit", edit_admin_section_path(section)
          span link_to "Delete", admin_section_path(section), method: :delete
        end
      end
    end
  end

  action_item :new, only: :show do
    link_to 'Create new menu section', new_admin_restaurant_section_path(resource)
  end

end
