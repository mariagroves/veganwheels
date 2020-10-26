class RefundEmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'mailers'

  def perform(order_id)
    puts "in the perform method"
    order = Order.find(order_id)
    user = order.user
    UserMailer.refund_order(user, order).deliver_later
  end
end
