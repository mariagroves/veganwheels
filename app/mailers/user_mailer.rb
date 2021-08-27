class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user

    mail to: @user.email, subject: "Welcome to Vegan Wheels! 👋"
  end

  def confirm_order(user, order)
    @user = user
    @order = order

    mail to: @user.email, subject: "New order #{@order.id} from #{@order.restaurant.name}"
  end

  def refund_order(user, order)
    @user = user
    @order = order

    mail to: @user.email, subject: "Your order from #{@order.restaurant.name} has been refunded."
  end
end
