class Seller < ApplicationRecord
	has_many :seller_address
	has_many :order 
	has_many :product 
	has_many :pincode , through: :seller_address
end
