class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :vendor_id, null: false
      t.integer :location_id, null: false
      t.integer :normal_time, null: false 

      t.timestamps
    end
    add_index :deliveries, :vendor_id 
    add_index :deliveries, :location_id
  end
end
