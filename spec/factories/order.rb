FactoryBot.define do 
	factory :order do 
		buyer_id {}
		seller_id{}
		status {'Waiting for Seller Confirmation'}
		buyer_address_id {}
		type_of_payment_id {}
		amount {500}
	end
end