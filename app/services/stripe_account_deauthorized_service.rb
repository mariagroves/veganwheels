class AccountDeauthorizedService
    def call(event)
        restaurant = Restaurant.find_by(stripe_account_id: event.data.object.account)
        restaurant.update(is_onboarded: false, stripe_account_id: '')
        # email development?
    end
end