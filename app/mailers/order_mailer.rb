class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_checkout.subject
  #
  def order_checkout
    @greeting = "Hi"
    @order = current_user.orders.first

    mail to: "to@example.org"
  end
end
