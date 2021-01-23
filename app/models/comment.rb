class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, :rating , presence: true

  default_scope { order(rating: :desc) }
end
