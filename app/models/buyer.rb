class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :buyer_address
	has_many :order
	has_many :pincode , through: :buyer_address
	

	CHECK_EMAIL =  /\A^(.+)@(.+)$\z/
	CHECK_PASSWORD = /\A^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$\z/
	validates :email , format: { with:  CHECK_EMAIL} , uniqueness: true
	validates :password , format: { with:  CHECK_PASSWORD}
	devise :registerable, :confirmable
end
