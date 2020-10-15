class StripeConnectedAccountService
    def call(event)
      restaurant = Restaurant.find_by(stripe_account_id: event.data.object.id)
      
      if event.data.object.details_submitted && event.data.object.charges_enabled
        restaurant.update(is_onboarded: true)
      end
    end
end
