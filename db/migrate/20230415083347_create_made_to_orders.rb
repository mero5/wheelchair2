class CreateMadeToOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :made_to_orders do |t|
      t.integer :customer_id, null: false
      t.string :telephone_number, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :flame, null: false
      t.string :model_name, null: false
      t.string :tire_size, null: false
      t.string :tire, null: false
      t.string :break, null: false
      t.string :caster, null: false
      t.string :color, null: false
      t.string :turnover, null: false
      t.string :option, null: false
      t.string :others, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
