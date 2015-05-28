class CreateUserlines < ActiveRecord::Migration
  def change
    create_table :userlines do |t|
      t.references :user, index: true, foreign_key: true
      t.references :line, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
