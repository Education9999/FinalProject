class Student < ActiveRecord::Base
	has_many :questions, dependent: :destroy
    has_many :answers, dependent: :destroy
	has_many :subjects,  dependent: :destroy
	has_many :like, dependent: :destroy

	has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  has_many :inverse_friends, through: :inverse_friendships, source: :student
end
