json.extract! product, :id, :name, :description, :image_url, :seller_id, :price, :quantity, :is_active, :created_at, :updated_at
json.url product_url(product, format: :json)
