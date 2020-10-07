ActiveAdmin.register RiderUser, namespace: :rider  do

  permit_params :email, :password, :password_confirmation, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :is_available, :is_active, :phone, :role

  menu false
  config.clear_action_items!

  controller do
    def update
      current_id = current_rider_user.id
      @rider_user = RiderUser.find(params[:id])

      if @rider_user.update_attributes(permitted_params[:rider_user])
        if @rider_user.id == current_id
          sign_in(RiderUser.find(current_id), :bypass => true)
        end
        flash[:notice] = I18n.t('devise.passwords.updated_not_active')
        redirect_to rider_rider_user_path(@rider_user)
      else
        render :action => :edit
      end

    end
  end

  action_item :edit, only: :show do
    link_to 'Edit Profile', edit_rider_rider_user_path(resource)
  end
  

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row "Available" do
        resource.is_available
      end
      row :phone
      row "Change Availability" do
        active_admin_form_for resource, url: toggle_available_rider_rider_user_path(resource), method: :patch do |f|
          f.inputs do 
            f.input :is_available, input_html: { :value => resource.is_available }, as: :hidden
          end
           f.action :submit, label: "Change Availability"
        end
      end
    end
  end

  member_action :toggle_available, method: [:post, :patch] do
    if params[:rider_user][:is_available] == "true"
      RiderUser.find(params[:id]).update(is_available: false)
    else
      RiderUser.find(params[:id]).update(is_available: true)
    end
    redirect_to rider_rider_user_path
  end

  form title: 'Edit Your Details' do |f|
    inputs 'Details' do
      input :first_name
      input :last_name
      input :email
      input :phone
      input :password
      input :password_confirmation
    end
    actions do
      action(:submit) 
      cancel_link(rider_rider_user_path)
    end
  end

end
