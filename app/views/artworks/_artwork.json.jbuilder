json.extract! artwork, :id, :user_id, :title, :description, :movement, :price, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
