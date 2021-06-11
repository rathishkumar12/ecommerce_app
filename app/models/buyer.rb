class Buyer < ApplicationRecord
	has_many :buyer_address
	has_many :order
	has_many :pincode , through: :buyer_address
end
