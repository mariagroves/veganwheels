class RestaurantUpdateWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default'

  def perform(category, restaurant_id)
    client = Twilio::REST::Client.new
    restaurant = Restaurant.find(restaurant_id)
    client.messages.create(
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: restaurant.admin_user.phone,
        body: "The restaurant is set to #{category} soon. Remember to update the Vegan Wheels status."
    )
  end

end
