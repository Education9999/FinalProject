class AddStudentToSubject < ActiveRecord::Migration
  def change
    add_reference :subjects, :student, index: true, foreign_key: true
  end
end
