ActiveAdmin.register WorkArea do
  permit_params :postcode

  index do
    selectable_column
    column :postcode
    actions
  end

  filter :postcode

  show do
    attributes_table do
      row :postcode
    end
  end

  form do |f|
    f.inputs do
      f.input :postcode
    end
    f.actions
  end

end
