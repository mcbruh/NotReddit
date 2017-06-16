class CommentDownvote < ApplicationRecord
	belongs_to :user
	belongs_to :comment

	def self.destroy_comment_vote(user, comment)
		current_comment_vote = Vote.where(user_id: user.id).where(comment_id: comment.id)
		current_comment_vote.destroy if current_comment_vote
	end

	def self.delete_comment_vote(user, comment)
		destroy_comment_vote(user, comment)
	end

end
