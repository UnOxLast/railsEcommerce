json.extract! product, :id, :name_product, :type_product, :brand_product, :qty_product, :price_product,:url_image, :created_at, :updated_at
json.url product_url(product, format: :json)

