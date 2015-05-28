class CreateUserstops < ActiveRecord::Migration
  def change
    create_table :userstops do |t|
      t.references :user, index: true, foreign_key: true
      t.references :stop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
