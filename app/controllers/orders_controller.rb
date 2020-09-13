class OrdersController < ApplicationController
    def create
        cart = Cart.find(params[:cart_id])
        order  = Order.create!(cart: cart, user: current_user)
        
        stripe_session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: order.id,
            # images: [teddy.photo_url],
            amount: order.total_price,
            currency: 'gbp',
            quantity: 1
          }],
          success_url: order_url(order),
          cancel_url: order_url(order)
        )
        
        order.update(checkout_session_id: stripe_session.id)
        redirect_to new_order_payment_path(order)

    end

    def show
        @order = current_user.orders.find(params[:id])
    end

    def destroy
        @order = current_user.orders.find(params[:id])
        @order.destroy
        redirect_to root_path
    end
end
