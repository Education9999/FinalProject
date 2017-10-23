class Subject < ActiveRecord::Base
	validates :student, presence: true
	belongs_to :student
	has_many :topics,  dependent: :destroy
end
