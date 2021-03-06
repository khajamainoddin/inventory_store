class OrderMailer < ApplicationMailer
  
  default from: "'Khaja' <from@example.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  # def received
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end

 

  def received(order)
     @order = order
     mail to: order.email, subject: 'Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    # @greeting = "Hi"
    @order = order

    mail to: order.email, subject: "Store Order Shipped."
  end
end
