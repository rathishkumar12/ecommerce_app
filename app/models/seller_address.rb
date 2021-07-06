class SellerAddress < ApplicationRecord
	belongs_to :seller
	belongs_to :pincode
	validates :street_name , presence: true
	validates :street_name ,length: { minimum:6 }
end
