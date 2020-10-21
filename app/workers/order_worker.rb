class OrderWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default'

  def perform(order_id)
    Order.find(order_id).destroy
  end
end
