class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_destroy :ensure_not_referenced_by_a_line_item

  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:   %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :discount_percentage, numericality: { less_than_or_equal_to: 100 }
  validates :title, length: { minimum:10 }

  scope :sort_by_price, -> { order(price: :asc) }
  scope :sort_by_discount, -> { order(discount_percentage: :desc) }
  

  def avg_rating
    comments.sum { |comment| comment.rating } / comments.count
  end

  private
    #ensure that there are no line items referencing this product
    def ensure_not_referenced_by_a_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
    
end
