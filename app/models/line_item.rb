class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart

  def total_price
    product.price * (100 - product.discount_percentage) / 100 * quantity
  end
end
