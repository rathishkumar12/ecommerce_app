class Product < ApplicationRecord
	belongs_to :seller 
	has_many :order_item
	has_many_attached :image
	belongs_to :category
	validates :name , presence: true
	validates :description , length: { minimum:6 }
	validates :price , presence:true
	validates :quantity , presence:true
end
