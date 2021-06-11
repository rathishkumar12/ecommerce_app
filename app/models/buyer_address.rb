class BuyerAddress < ApplicationRecord
	belongs_to :buyer
	belongs_to :pincode
end
