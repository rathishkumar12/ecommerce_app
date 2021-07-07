class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  devise :registerable, :confirmable
  
  has_many :buyer_address
  has_many :order
  has_many :pincode , through: :buyer_address
  has_many :access_grants,
  class_name: 'Doorkeeper::AccessGrant',
  foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

 has_many :access_tokens,
 class_name: 'Doorkeeper::AccessToken',
 foreign_key: :resource_owner_id,
 dependent: :delete_all # or :destroy if you need callbacks


  CHECK_EMAIL =  /\A^(.+)@(.+)$\z/
  CHECK_PASSWORD = /\A^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$\z/

  validates :email , format: { with:  CHECK_EMAIL} , uniqueness: true
	

	def self.authenticate(email, password)
		buyer = Buyer.find_for_authentication(email: email)
		buyer &.valid_password?(password) ? buyer : nil
	end

	def active_for_authentication?
  super && self.is_active
  end

  def inactive_message
	"Sorry, this account is not active."
  end

end
