FactoryBot.define do 
	factory :order_item do 
		order_id {}
		product_id {}
		quantity {10}
	end

end