class OrderMailer < ApplicationMailer


 def new_order_email
    @order = params[:order]
    mail(to: @order.buyer.email, subject: "ECOM- ORDER CONFIRMATION ! ! !")
  end
end
