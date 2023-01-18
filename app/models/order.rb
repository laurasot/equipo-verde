class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  belongs_to :user

  monetize :total_price_cents

end
