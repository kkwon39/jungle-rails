class OrderMailer < ApplicationMailer
  default from: 'reply@jungle.com'

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: "Rainforest - Order - #{@order.id}")
  end
end
