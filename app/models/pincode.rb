class Pincode < ApplicationRecord
	has_many :buyer_address
	has_many :seller_address
	validates :pincode, presence: true 
end
