class OrderWorker
  include Sidekiq::Worker

  def perform(order_id)
    Order.find(order_id).update(state: 'expired')
  end
end
