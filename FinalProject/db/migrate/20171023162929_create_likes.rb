class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :student, index: true, foreign_key: true
      t.integer :likeable_id
      t.string :likeable_type

      t.timestamps null: false
    end
  end
end
