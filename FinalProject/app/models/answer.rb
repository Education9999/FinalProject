class Answer < ActiveRecord::Base
  belongs_to :student
  belongs_to :question

  has_many :likes, as: :likeable
end
