json.extract! seller_address, :id, :seller_id, :street_name, :lat, :lon, :pincode_id, :created_at, :updated_at
json.url seller_address_url(seller_address, format: :json)
