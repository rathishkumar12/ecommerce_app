class BuyerAddress < ApplicationRecord
	belongs_to :buyer
	belongs_to :pincode
	has_many :order 
end
