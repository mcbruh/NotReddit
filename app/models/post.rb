class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, :as => :commentable
	has_many :votes
	validates :title, :presence => true
end
