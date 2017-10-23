class Friendship < ActiveRecord::Base
  belongs_to :student
  belongs_to :friend, class_name: 'Student'
  validates :student, presence: true
  validates :friend, presence: true
end
 