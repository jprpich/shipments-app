class ChangeTrackingNumberToBeStringInOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :tracking_number, :string 
  end
end
