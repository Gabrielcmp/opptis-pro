json.extract! restaurant, :id, :name, :cnpj, :cousine, :phone, :address, :formatted_address, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
