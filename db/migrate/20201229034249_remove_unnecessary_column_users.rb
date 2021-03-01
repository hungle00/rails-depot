class RemoveUnnecessaryColumnUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :buyer
    remove_column :users, :sign_in_count
    remove_column :users, :current_sign_in_at
    remove_column :users, :last_sign_in_at
  end
end
