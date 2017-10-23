class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password
      t.text :school_name
      t.integer :age
      t.integer :class
      t.string :board

      t.timestamps null: false
    end
  end
end
