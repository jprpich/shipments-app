class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :number, null: false 
      t.integer :vendor_id, null: false 
      t.integer :tracking_number, null: false 
      t.string :address, null: false 
      t.datetime :shipped_at
      t.datetime :delivered_at
    end
    add_index :orders, :vendor_id
  end
end
