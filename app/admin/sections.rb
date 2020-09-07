ActiveAdmin.register Section do

  permit_params :name, :order, :restaurant_id

  index do
    selectable_column
    column :name
    column "Order in the menu", :order
    column :restaurant
    actions
  end

  config.sort_order = 'order_asc'

  form partial: 'form'

  menu label: "Menu Sections"
  controller do
    before_action { @page_title = "Menu Sections" }

    def destroy 
      super do |format| 
        if @section.errors.any?
          redirect_to(
            admin_sections_path,
            alert: "You can't delete a section while it has contains menu items. Please delete those first."
          ) and return
        end
      end
    end
  end
end
