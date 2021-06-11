class Order < ApplicationRecord
	belongs_to :seller
	belongs_to :buyer 
	has_many :order_item
end
