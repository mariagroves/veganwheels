class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    puts order
    order.update!(state: "paid", order_time: Time.current)
    puts order
    NewOrderEmailWorker.perform_async(order.id)
  end
end
