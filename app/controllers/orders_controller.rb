class OrdersController < ApplicationController
    def create
        cart = Cart.find(params[:cart_id])
        restaurant = cart.order_items.first.menu_item.restaurant
        order  = Order.create!(cart: cart, user: current_user, restaurant: restaurant)
        
        stripe_session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: order.id,
            # images: [teddy.photo_url],
            amount: order.total_price,
            currency: 'gbp',
            quantity: 1
          }],
          success_url: dashboard_index_url,
          cancel_url: new_order_payment_url(order)
        )
        
        order.update(checkout_session_id: stripe_session.id)
        redirect_to new_order_payment_path(order)
        session[:cart_id] = nil
    end

    def index
      @orders = Order.where(open: false, state: "paid", user_id: current_user.id)  
    end

    def destroy
        @order = current_user.orders.find(params[:id])
        @order.destroy
        redirect_to root_path
    end
end
