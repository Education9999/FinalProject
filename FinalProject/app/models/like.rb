class Like < ActiveRecord::Base

  belongs_to :likeable, polymorphic: true
  validates :likeable, presence: true
  validates :student, presence: true
  belongs_to :student
end
