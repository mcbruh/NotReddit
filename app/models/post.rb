class Post < ApplicationRecord
	acts_as_votable
	belongs_to :user
	has_many :comments
	has_many :votes
	before_create :authenticate_user!
end
