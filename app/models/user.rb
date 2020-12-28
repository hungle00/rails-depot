class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  validates :username, presence: true, uniqueness: true
  
  def count_order
    orders.count
  end

  def count_comment
    comments.count
  end

  def self.to_csv
    attributes = %w{email username count_order count_comment}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
end