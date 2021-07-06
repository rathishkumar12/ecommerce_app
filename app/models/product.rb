class Product < ApplicationRecord
	belongs_to :seller 
	has_many :order_item
	has_many_attached :image
	belongs_to :category
	validates :name , presence: true
	validates :description , length: { minimum:6 }
	validates :price , presence:true
	validates :quantity , presence:true
	validates :quantity , numericality: { greater_than: 0 }

    # for generating csv of product records
	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |product|
				csv << product.attributes.values_at(*column_names)
			end 
		end
	end	


end
