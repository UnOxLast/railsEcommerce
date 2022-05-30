class OrderItem < ApplicationRecord
    belongs_to :product
    belongs_to :cart, optional: true
    belongs_to :order

    # LOGIC
    def total_price
        self.quantity * self.product.price
    end
end
