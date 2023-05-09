class CreateColors < ActiveRecord::Migration[6.1]
  def change
    create_table :colors do |t|
      t.integer :made_to_order_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
