class CreateCommentstops < ActiveRecord::Migration
  def change
    create_table :commentstops do |t|
      t.references :comment, index: true, foreign_key: true
      t.references :stop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
