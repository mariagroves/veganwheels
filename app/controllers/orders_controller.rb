class OrdersController < ApplicationController
    def create
        cart = Cart.find(order_params[:cart_id])
        restaurant = cart.order_items.first.menu_item.restaurant
        delivery_instructions = order_params[:delivery_instructions]
        order  = Order.create!(cart: cart, user: current_user, restaurant: restaurant, delivery_instructions: delivery_instructions)
      
        with_stripe_error_handling(order) do
          stripe_session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
              name: "Order #{order.id} from #{order.restaurant.name}",
              # images: [order.restaurant.photo],
              description: 'Thank you for ordering with Vegan Wheels!',
              amount: order.total_price,
              currency: 'gbp',
              quantity: 1
            }],
            payment_intent_data: {
              application_fee_amount: Business.first.delivery_price,
              metadata: {order_id: order.id}
            },
            success_url: dashboard_index_url,
            cancel_url: new_order_payment_url(order),
            }, {stripe_account: restaurant.stripe_account_id})

        order.update(checkout_session_id: stripe_session.id)
        redirect_to new_order_payment_path(order)
        session[:cart_id] = nil
        # OrderWorker.perform_at(10.minutes.from_now, order.id)
      end
    end

    def index
      @orders = Order.where(open: false, state: ["paid", "refunded"], user_id: current_user.id)  
    end

    def destroy
        @order = current_user.orders.find(params[:id])

        # queue = Sidekiq::ScheduledSet.new
        # queue.each do |job|
        #   job.delete if (job.klass == 'OrderWorker' && job.args.first == @order.id)
        # end

        @order.destroy
        redirect_to restaurant_path(@order.restaurant)
    end

    private

    def with_stripe_error_handling(order, &block)
      begin
        yield
      rescue ::Stripe::CardError,                   # card declined
             ::Stripe::RateLimitError,              # too many requests made to the api too quickly
             ::Stripe::InvalidRequestError,         # invalid parameters were supplied to Stripe's api
             ::Stripe::AuthenticationError,         # authentication with stripe's api failed
             ::Stripe::APIConnectionError,          # network communication with stripe failed
             ::Stripe::StripeError,                 # generic error
             ::ActiveRecord::ActiveRecordError => e # something broke saving our records

        # email dev about error
        puts e
        order.destroy
        redirect_to error_path
      end
  end

    def order_params
        params.require(:order).permit(:delivery_instructions, :cart_id)
    end
end
