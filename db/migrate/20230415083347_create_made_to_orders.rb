class CreateMadeToOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :made_to_orders do |t|
      t.integer :customer_id, null: false
      t.string :flame, null: false
      t.string :flame2, null: false
      t.string :wheelchair_type, null: false
      t.string :material, null: false
      t.integer :flame_color_id, null: false
      t.integer :side_color_id, null: false
      t.integer :seat_color_id, null: false
      t.integer :back_color_id, null: false
      t.string :break, null: false
      t.string :nursing_break
      t.string :turnover
      t.string :cane
      t.string :cane2
      t.string :cushion
      t.string :table
      t.string :others
      t.string :message
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
