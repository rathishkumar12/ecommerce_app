json.extract! order, :id, :buyer_id, :seller_id, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
