class AddColumnsToFriendship < ActiveRecord::Migration
  def change
    add_reference :friendships, :student, index: true, foreign_key: true
    add_reference :friendships, :friend, index: true, foreign_key: true
  end
end
