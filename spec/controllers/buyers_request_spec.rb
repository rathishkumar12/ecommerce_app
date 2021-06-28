require 'rails_helper'

RSpec.describe "buyers_controller",type: :request do 
	
	before do 
		@buyer=Buyer.new(buyer_name:'lakshmi',email:'18euee059@skcet.ac.in',phone_number:8681008767,password:'lakshmi123',is_active:true)
		@pincode=Pincode.new(pincode:641026,city:'coimbatore',area:'selvapuram')
		@buyer.skip_confirmation!
		@buyer.save 
		@pincode.save
	end  

	context 'GET requests' do 

		it 'success response for #INDEX' do
			get api_v1_buyers_path
			puts response.body
			expect(response).to be_successful
		end

		it 'success response for #SHOW' do 
			get api_v1_buyers_path+"/"+@buyer.id.to_s
			puts response.body
			expect(response).to be_successful
		end

	end	

	context 'DELETE requests' do 
		it 'success response for #DESTROY' do 
			delete api_v1_buyers_path+"/"+@buyer.id.to_s
			puts response.body
			expect(response).to be_successful
		end 	
	end	

	context 'POST requests' do 
		it 'success response for #CREATE' do 
			post api_v1_buyers_path(email:'18tucs041@skct.edu.in',buyer_name:'hari',phone_number:8681008767,password:'hari123',is_active:true)
			puts response.body
			expect(response).to be_successful
		end 	
	end	
	context 'PUT requests' do 
		it 'success response for #UPDATE' do 
			put api_v1_buyers_path+"/"+@buyer.id.to_s+"?buyer_name=RathishKumar"
			puts response.body
			expect(response).to be_successful
		end 	
	end	
end	




