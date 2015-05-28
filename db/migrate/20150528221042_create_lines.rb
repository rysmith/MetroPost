class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :line_id
      t.string :line_name

      t.timestamps null: false
    end
  end
end
