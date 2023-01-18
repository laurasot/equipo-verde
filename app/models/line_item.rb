class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  monetize :total_price_cents

end
