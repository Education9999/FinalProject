class AddColumnsToStudent < ActiveRecord::Migration
  def change
  	add_column :students, :name, :string
  	add_column :students, :school_name, :text
  	add_column :students, :age, :integer
  	add_column :students, :board, :string
  	add_column :students, :student_class, :integer
  end
end

