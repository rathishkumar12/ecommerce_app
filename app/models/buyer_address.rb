class BuyerAddress < ApplicationRecord
	belongs_to :buyer
	belongs_to :pincode
	has_many :order 
	validates :street_name , presence: true
end
