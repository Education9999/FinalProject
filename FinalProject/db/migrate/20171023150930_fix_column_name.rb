class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :students, :class, :student_class
  end
end
