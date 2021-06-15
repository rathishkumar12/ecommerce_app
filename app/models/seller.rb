class Seller < ApplicationRecord
	has_many :seller_address
	has_many :order 
	has_many :product 
	has_many :pincode , through: :seller_address

	CHECK_EMAIL =  /\A^(.+)@(.+)$\z/
	CHECK_PASSWORD = /\A^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$\z/
	validates :seller_name , presence:true
	validates :seller_company_name , presence: true
	validates :phone_number , length:  { is:10 } , uniqueness: true
	validates :email , format: { with:  CHECK_EMAIL}, uniqueness: true
	validates :password , format: { with:  CHECK_PASSWORD}
end
