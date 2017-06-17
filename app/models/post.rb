class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, :as => :commentable
	validates :title, :presence => true
	validates :body, :presence => true
	acts_as_votable

	def comment_total
		parent_comments = Comment.where(:commentable_id => id)
		child_comments = Comment.where(:commentable_id => parent_comments.map(&:id))
		child_comments
	end
	
end
