class Topic < ActiveRecord::Base
	validates :subject, presence: true
	belongs_to :subject
end
