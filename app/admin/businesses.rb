ActiveAdmin.register Business do
  permit_params :delivery_price, :phone, :email, :about, :faqs, :privacy, :terms
  config.filters = false
  config.clear_action_items!
  menu label: "Business Information"

  index do
    column :delivery_price do |item|
      number_to_currency(to_pounds(item.delivery_price), unit: "£")
    end
    column :phone
    column :email
    column :about do |my_resource|
      truncate(my_resource.about, length: 50)
    end
    column "FAQs", :faqs do |my_resource|
      truncate(my_resource.faqs, length: 50)
    end
    column :privacy do |my_resource|
      truncate(my_resource.privacy, length: 50)
    end
    column "Terms and Conditions", :terms do |my_resource|
      truncate(my_resource.terms, length: 50)
    end
    actions
  end

  controller do
    before_action { @page_title = "Business Information" }
  end

  show do
    attributes_table do
      row :phone
      row :email
      row :delivery_price do |my_resource|
        number_to_currency(to_pounds(my_resource.delivery_price), unit: "£")
      end
      row :about do |my_resource|
        
        my_resource.about
      end
      row :faqs do |my_resource|
        my_resource.faqs
      end
      row :privacy do |my_resource|
        my_resource.privacy
      end
      row :terms do |my_resource|
        my_resource.terms
      end
    end
  end
  
  form do |f|
    f.inputs 'Business Information' do
      f.input :phone
      f.input :email
      f.input :delivery_price
    end
    f.inputs 'About' do
      f.input :about, label: false, as: :quill_editor
    end
    f.inputs 'FAQs' do
      f.input :faqs, label: false, as: :quill_editor
    end
    f.inputs 'Privacy' do
      f.input :privacy, label: false, as: :quill_editor
    end
    f.inputs 'Terms and Conditions' do
      f.input :terms, label: false, as: :quill_editor
    end
    f.actions
  end
end
