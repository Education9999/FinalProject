class Question < ActiveRecord::Base

	validates :student, presence: true

	belongs_to :student
	has_many :answers

	has_many :likes, as: :likeable
end

