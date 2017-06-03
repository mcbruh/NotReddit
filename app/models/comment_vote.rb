class CommentVote < ApplicationRecord
	belongs_to :user
	belongs_to :comment

	def up?
		value == 1
	end

	def down?
		!up?
	end

	def self.up(user, comment)
		CommentVote.create(user_id: user.id, comment_id: comment.id, value: 1)
	end

	def self.down(user,comment)
		CommentVote.create(user_id: user.id, comment_id: comment.id, value: -1)
	end
end
