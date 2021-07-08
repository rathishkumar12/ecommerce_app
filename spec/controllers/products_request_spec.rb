require 'rails_helper'

RSpec.describe "ProductController",type: :request do 

	    before do
		@category=create(:category)
		@buyer =create(:buyer,:email=>'rathishkumar.rkdo@gmail.com')
		@seller=create(:seller)
		@product=create(:product,:category_id=>@category.id,:seller_id=>@seller.id)
	    @pincode=create(:pincode)
		@buyer_address=create(:buyer_address,:buyer_id=>@buyer.id,:pincode_id=>@pincode.id)
		@type_of_payment=create(:type_of_payment)
	    end

	context '#GET requests' do 
		it 'renders add products page if seller signed_in' do
			sign_in @seller
			get new_product_path
			expect(response).to render_template 'products/new'
	    end

	    it 'redirects seller to signed_in page if seller NOT signed_in' do
			
			get new_product_path
			expect(response).to redirect_to new_seller_session_path
	    end
	end	

	context 'Product adding flow by Seller' do 

		it 'Redirects to Product #SHOW page after adding all the details' do 
			sign_in @seller
			post '/products' , :params => {:product=>{:name=>'lays',:description=>'too low price',:price=>20,:quantity=>20,:is_active=>true,:category_id=>@category.id}}
			expect(response.status).to eq(302)  
		end 

	end

end	