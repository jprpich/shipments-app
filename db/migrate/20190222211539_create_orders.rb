class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :number
      t.integer :vendor_id
      t.integer :tracking_number
      t.string :address
      t.datetime :shipped_at
      t.datetime :delivered_at
    end
  end
end
