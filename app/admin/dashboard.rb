ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    panel "Publishing the restaurant on Vegan Wheels" do
      para "Check that you have done the following:"
      para "1. Provided the correct mobile phone number for the admin. This number will be used to notify you of new orders. Check it by clicking the profile icon in the top right."
      para "2. Completed Stripe onboarding by following the link in Restaurant Information. Once the onboarding is complete the Stripe Account column will be marked 'Yes'."
      para "3. Checked the information on the restaurant which will appear above the menu on Vegan Wheels. This can be done in Restaurant Information."
      para "4. Created the menu."
      para "5. Set the restaurant as open and published. This can be done by navigating to the Restaurant Information, and then clicking 'Edit'. Select 'Is open' and 'Is published'."
    end
    panel "Creating the menu" do
      para "1. Create at least one menu section. This can be done by navigating to Restaurant Information, and then clicking on 'View'. There you can click 'Create new menu section'."
      para "2. Create menu items. Navigate to Menu Sections, select the relevant section by clicking 'View'. There you can click 'Create new menu item'."
      para "3. If a menu item has optional sides, create them by navigating to Menu Items, select the relevant item by clicking 'View'. There you can click 'Create new side'."
      para "4. Control whether a menu item appears on Vegan Wheels. If an item is not available for any reason, you can temporarily prevent it from appearing on Vegan Wheels by clicking 'Edit' and de-selecting 'Active'."
    end
    panel "Controlling when the restaurant is available for orders" do
      para "1. Opening Hours. Go to Restaurant Information and check that the opening hours are correct. Customers will be able to place orders during the opening hours. It is therefore recommended that the closing time is the last orders time (and not the actual closing time of the restaurant)."
      para "2. If at any point during normal opening hours you would like to stop customers from ordering from the restaurant, navigate to Restaurant Information, click 'Edit' and de-select 'Is open'."
      para "Note that unless 'Is open' is selected, customers will not be able to order, even if they attempt to do so during opening hours. Therefore ensure that 'Is open' is always selected (except when you are temporarily stopping orders)."
    end
    panel "Receiving orders" do
      para "When you receive a notification about a new order:"
      para "1. Navigate to the Orders section."
      para "2. The new orders will be marked 'Order in progress' - 'Yes'."
      para "3. View details of the order by clicking 'View'. Items ordered will be listed there."
    end
  end 
end
