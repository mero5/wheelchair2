class CreateRepairs < ActiveRecord::Migration[6.1]
  def change
    create_table :repairs do |t|
      t.integer :customer_id, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :wheelchair_kinds, null: false
      t.string :tire
      t.string :break
      t.string :caster
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
