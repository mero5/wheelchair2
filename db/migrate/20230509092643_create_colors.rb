class CreateColors < ActiveRecord::Migration[6.1]
  def change
    create_table :colors do |t|
      t.integer :made_to_order_id
      t.string :name, null: false
      t.boolean   :is_active,    :null => false,  default: true

      t.timestamps
    end
  end
end
