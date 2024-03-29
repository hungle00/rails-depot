class Order < ApplicationRecord
  include GenerateCsv
  
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  has_many :line_items, dependent: :destroy

  delegate :username, :email, :to => :user, :allow_nil => true
  
  enum pay_type: {
    "Check"         => 0,
    "Credit card"   => 1,
    "Purchase order"=> 2
  }

  validates :address, presence: true
  validates :pay_type, inclusion: pay_types.keys
  before_create :ensure_address_exist

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_products
    products = {}
    line_items.includes(:product).each do |line_item|
      line_item.product_title = line_item.quantity
    end
    products
  end

  def total_price
    total_price = 0
    line_items.each do |line_items|
      total_price += line_items.total_price
    end
    total_price
  end
  # def self.to_csv
  #   attributes = %w{address pay_type user_id created_at updated_at}
  #   CSV.generate(headers: true) do |csv|
  #     csv << attributes

  #     all.each do |order|
  #       csv << attributes.map{ |attr| order.send(attr) }
  #     end
  #   end
  # end

  private 

  def ensure_address_exist
    if latitude.nil?
      errors.add(:base, 'Address not exist')
      throw :abort
    end
  end
end
