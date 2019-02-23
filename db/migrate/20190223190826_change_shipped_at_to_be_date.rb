class ChangeShippedAtToBeDate < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :shipped_at, :date 
  end
end
