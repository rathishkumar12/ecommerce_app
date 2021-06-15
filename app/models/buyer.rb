class Buyer < ApplicationRecord
	has_many :buyer_address
	has_many :order
	has_many :pincode , through: :buyer_address
	validates :buyer_name, presence: true , length: { minimum:2 , maximum:20 }
	validates :phone_number, presence: true , length: { is: 10 } , uniqueness: true

	CHECK_EMAIL =  /\A^(.+)@(.+)$\z/
	CHECK_PASSWORD = /\A^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$\z/
	validates :email , format: { with:  CHECK_EMAIL} , uniqueness: true
	validates :password , format: { with:  CHECK_PASSWORD}
end
