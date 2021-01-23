class AddDiscountPercentageToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :discount_percentage, :integer, null: true, default: 0
  end
end
