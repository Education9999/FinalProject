class AddStudentToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :student, index: true, foreign_key: true
  end
end
