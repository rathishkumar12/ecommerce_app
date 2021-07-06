class Order < ApplicationRecord
	belongs_to :seller
	belongs_to :buyer 
	has_many :order_item , dependent: :destroy
	has_many :product ,through: :order_item
	belongs_to :buyer_address 
	belongs_to :type_of_payment
	validates :buyer_address_id , presence:true
end
