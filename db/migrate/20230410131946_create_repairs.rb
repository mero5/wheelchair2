class CreateRepairs < ActiveRecord::Migration[6.1]
  def change
    create_table :repairs do |t|

      t.timestamps
    end
  end
end
