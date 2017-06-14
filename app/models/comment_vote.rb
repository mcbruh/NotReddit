class CommentVote < ApplicationRecord
	belongs_to :user
	belongs_to :comment

	def upvote?
		value == 1
	end

	def downvote?
		!up?
	end

	def self.upvote(user, comment)
		CommentVote.create(user_id: user.id, comment_id: comment.id, value: 1)
	end

	def self.downvote(user,comment)
		CommentVote.create(user_id: user.id, comment_id: comment.id, value: -1)
	end
	
end
