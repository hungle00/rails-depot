class RemoveBuyerColumnFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :buyer
  end
end
