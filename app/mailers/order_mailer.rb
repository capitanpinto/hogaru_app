class OrderMailer < ApplicationMailer

  def order_checkout
    @greeting = "Hi"
    @order = current_user.orders.first

    mail to: "to@example.org"
  end
  
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Order check out"
  end
end
