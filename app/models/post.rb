class Post < ApplicationRecord
	acts_as_commentable
	belongs_to :user
	has_many :comments, :as => :commentable
	has_many :votes
end
