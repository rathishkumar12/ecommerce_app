# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
require 'rails_helper'

class OrderMailerPreview < ActionMailer::Preview
	@category=create(:category)
	@buyer =create(:buyer,:email=>'rathish@gmail.com')
	@seller=create(:seller)
	@product=create(:product,:category_id=>@category.id,:seller_id=>@seller.id)
    @pincode=create(:pincode)
	@buyer_address=create(:buyer_address,:buyer_id=>@buyer.id,:pincode_id=>@pincode.id)
	@type_of_payment=create(:type_of_payment)
	@order=create(:order,:buyer_id=>@buyer.id,:seller_id=>@seller.id,:type_of_payment_id=>@type_of_payment.id,:buyer_address_id=>@buyer_address.id)
	@order_item=create(:order_item,:order_id=>@order.id,:product_id=>@product.id)
    OrderMailer.with(order: @order).new_order_email
end
