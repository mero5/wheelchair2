class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :customer_id
      t.integer :item_id
      t.integer :order_id
      t.integer :repair_id
      t.integer :made_to_order_id
      t.integer :price
      t.integer :making_status, null: false, default: 0
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
