class CreateReads < ActiveRecord::Migration[6.1]
  def change
    create_table :reads do |t|
      t.integer :customer_id, null: false
      t.integer :room_id, null: false
      t.boolean :complete,        null: false, default: false
      t.datetime :open_time

      t.timestamps
    end
  end
end
