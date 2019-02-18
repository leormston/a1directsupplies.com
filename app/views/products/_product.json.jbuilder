json.extract! product, :id, :name, :description, :part_number, :image_url, :price, :category, :brand, :created_at, :updated_at
json.url product_url(product, format: :json)
