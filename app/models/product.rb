class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :orders, through: :line_items

  belongs_to :category

  monetize :price_cents
end
