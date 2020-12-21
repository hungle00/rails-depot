class AddUserToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :user, foreign_key: true

    remove_column :orders, :name
    remove_column :orders, :email
  end
end
