class NewOrderEmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'mailers'

  def perform(order_id)
    order = Order.find(order_id)
    user = order.user
    UserMailer.confirm_order(user, order).deliver_later
  end
end
