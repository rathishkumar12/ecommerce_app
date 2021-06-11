json.extract! buyer, :id, :buyer_name, :email, :phone_number, :password, :is_active, :created_at, :updated_at
json.url buyer_url(buyer, format: :json)
