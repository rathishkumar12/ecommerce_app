require 'rails_helper'

RSpec.describe "buyers_controller",type: :request do 
	
	before do 
		@buyer=create(:buyer)
		@pincode=create(:pincode)
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




