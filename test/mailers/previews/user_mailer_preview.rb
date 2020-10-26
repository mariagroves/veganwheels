# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.first
    UserMailer.welcome(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/confirm_order
  def confirm_order
    user = User.first
    order = Order.last
    UserMailer.confirm_order(user, order)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/refund_order
    def refund_order
      user = User.first
      order = Order.last
      UserMailer.refund_order(user, order)
    end

end
