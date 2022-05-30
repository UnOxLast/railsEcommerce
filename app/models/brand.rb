class Brand < ApplicationRecord
    validates :byBrand, presence: true, uniqueness: true
    has_many :products
end
