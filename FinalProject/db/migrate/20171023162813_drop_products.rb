class DropProducts < ActiveRecord::Migration
  def change
  	drop_table :likes
  end
end
