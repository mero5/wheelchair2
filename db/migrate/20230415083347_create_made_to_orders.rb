class CreateMadeToOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :made_to_orders do |t|
      t.integer :customer_id, null: false
      t.string :flame, null: false
      t.string :flame2, null: false
      t.string :type, null: false
      t.string :material, null: false
      t.string :flame_color, null: false
      t.string :side_color, null: false
      t.string :seat_color, null: false
      t.string :back_color, null: false
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
