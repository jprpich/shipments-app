class ChangeDeliveredAtToBeDate < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :delivered_at, :date
  end
end
