class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id, null: false
      t.string :delivery_name, null: false
      t.string :delivery_address, null: false
      t.string :delivery_postcode, null: false

      t.timestamps
    end
  end
end
