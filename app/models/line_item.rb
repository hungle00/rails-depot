class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart

  delegate :title, :to => :product, :prefix => true, :allow_nil => true

  def total_price
    product.price * (100 - product.discount_percentage) / 100 * quantity
  end
end
