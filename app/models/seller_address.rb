class SellerAddress < ApplicationRecord
	belongs_to :seller
	belongs_to :pincode
end
