class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, :as => :commentable
	has_many :votes
	validates :title, :presence => true
	validates :body, :presence => true

	def comment_total
		
	end
end
