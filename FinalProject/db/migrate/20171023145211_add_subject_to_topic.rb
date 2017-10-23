class AddSubjectToTopic < ActiveRecord::Migration
  def change
    add_reference :topics, :subject, index: true, foreign_key: true
  end
end
