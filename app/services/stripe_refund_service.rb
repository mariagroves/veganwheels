class StripeRefundService
    def call(event)
        order = Order.find_by(id: event.data.object.metadata.order_id)
        order.update(state: 'refunded', open: false)
    end
end