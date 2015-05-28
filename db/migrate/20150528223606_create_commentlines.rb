class CreateCommentlines < ActiveRecord::Migration
  def change
    create_table :commentlines do |t|
      t.references :comment, index: true, foreign_key: true
      t.references :line, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
