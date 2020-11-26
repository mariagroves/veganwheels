ActiveAdmin.register_page "Dashboard", namespace: :rider do
    menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }
  
    content title: proc { I18n.t("active_admin.dashboard") } do
      panel "Check your information is complete" do
        para "Check that you have the following:"
        para "1. Correct mobile phone number."
        para "2. At least one Rider Work Area. You can sign up for areas in the Rider Work Areas section."
      end
      panel "Set yourself as available at the beginning of your shift" do
        para "Go to your profile and set yourself as available. Unless you are set to available, you will not receive notifications of new delivery jobs."
      end
      panel "Sign up for delivery jobs" do
        para "1. When you get a notification that a job is available, review the job in the Available Deliveries section."
        para "2. Once your sign up for a delivery job, it will be listed in My Deliveries."
        para "3. On collecting the order from the restaurant, mark the order as collected in My Deliveries."
        para "4. Mark the order as delivered in My Deliveries once you have handed the food over to the customer."
      end

      panel "Set yourself as not available at the end of your shift" do
        para "Go to your profile and set yourself as not available."
      end
    end 
  end