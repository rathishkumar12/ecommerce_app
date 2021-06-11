json.extract! buyer_address, :id, :buyer_id, :street_name, :lat, :lon, :pincode_id, :created_at, :updated_at
json.url buyer_address_url(buyer_address, format: :json)
