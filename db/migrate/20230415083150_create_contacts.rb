class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :subject, null: false
      t.text :message, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
