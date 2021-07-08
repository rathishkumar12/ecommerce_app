require 'rails_helper'

RSpec.describe "OrderController",type: :request do 

	before do
		@category=create(:category)
		@buyer =create(:buyer,:email=>'rathishkumar.rkdo@gmail.com')
		@seller=create(:seller)
		@product=create(:product,:category_id=>@category.id,:seller_id=>@seller.id)
	    @pincode=create(:pincode)
		@buyer_address=create(:buyer_address,:buyer_id=>@buyer.id,:pincode_id=>@pincode.id)
		@type_of_payment=create(:type_of_payment)
	end
	context 'ORDER GET REQUESTS' do 

	    it 'renders ORDER page when BUYER logged in' do
	    	sign_in create(:buyer)
			get buyers_order_path
			expect(response).to render_template 'orders/index'
	    end

	    it 'renders ORDER page when SELLER logged in' do
	    	sign_in @seller
			get sellers_order_path
			expect(response).to render_template 'orders/index'
	    end

	end	
	context 'BOOKING ORDER' do 

		  it '#1 selecting address for booking order' do 
	    	sign_in create(:buyer)
	    	get buyer_addresses_path(product_id:@product.id,seller_id:@seller.id)
	    	expect(response).to render_template 'buyer_addresses/index'
	      end

	      it '#2 After selecting buyer address' do 
	    	sign_in create(:buyer)
	    	get new_order_path(product_id:@product.id,seller_id:@seller.id,address_id:@buyer_address.id)
	    	expect(response).to render_template 'orders/new'
	      end

	      it '#3 selecting quantity and type_of_payment for booking order' do 
	      	sign_in create(:buyer)
	      	get new_order_path(product_id:@product.id,seller_id:@seller.id,address_id:@buyer_address.id)
	      	post orders_path,:params => { :order=> {:status=>'Waiting',:type_of_payment_id=>@type_of_payment.id,:quantity=>3} }
	      	expect(response.status).to  eq(302)
	      end
	end
end	