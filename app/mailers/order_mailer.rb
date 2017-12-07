class OrderMailer < ApplicationMailer
  def order_email(order)
    @order = order
    @products = Product.all
    mail(to: @order.email, subject: "Order #{ @order.id } - Payment Receipt")
  end
end
