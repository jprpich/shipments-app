class AddLocationToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :location_id, :integer
  end
end
