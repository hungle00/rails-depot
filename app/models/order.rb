class Order < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  has_many :line_items, dependent: :destroy
  
  enum pay_type: {
    "Check"         => 0,
    "Credit card"   => 1,
    "Purchase order"=> 2
  }

  validates :address, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def distance
  end

  def self.to_csv
    attributes = %w{address pay_type user_id created_at updated_at}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |order|
        csv << attributes.map{ |attr| order.send(attr) }
      end
    end
  end
end
