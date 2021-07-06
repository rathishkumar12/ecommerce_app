class TypeOfPayment < ApplicationRecord
	has_many :order
	validates :name ,presence:true 
end
