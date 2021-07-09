class Product < ApplicationRecord
	belongs_to :seller 
	has_many :order_item
	has_many_attached :image
	belongs_to :category
	validates :name , presence: true
	validates :description , length: { minimum:6 }
	validates :price , presence:true
	validates :quantity , presence:true
	

    # for generating csv of product records
    
	def self.to_csv
		CSV.generate do |csv|
			column_names = %w(Project_ID Product_Name Description Price Quantity Category Is_active Created_At )
			csv << column_names
			all.each do |product|
				csv << [product.id,product.name,product.description,product.price,product.quantity,product.category.category_name,product.is_active,product.created_at]
			end 
		end
	end	


end
