FactoryBot.define do 
	factory :product do 
		name {'lays'}
		description {'for sale at low price'}
		category_id {1}
		price {180}
		is_active {true}
		quantity {10}
	end

end