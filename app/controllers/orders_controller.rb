class OrdersController < ApplicationController
    def create
        cart = Cart.find(order_params[:cart_id])
        restaurant = cart.order_items.first.menu_item.restaurant
        delivery_instructions = order_params[:delivery_instructions]
        order  = Order.create!(cart: cart, user: current_user, restaurant: restaurant, delivery_instructions: delivery_instructions)
        
        stripe_session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: "Order #{order.id} from #{order.restaurant.name}",
            # images: [order.restaurant.photo],
            description: 'Thank you for ordering with Vegan Wheels!',
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

    private

    def order_params
        params.require(:order).permit(:delivery_instructions, :cart_id)
    end
end
