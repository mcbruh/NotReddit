class Vote < ApplicationRecord
	belongs_to :user
	belongs_to :post

	def upvote?
		value == 1
	end

	def downvote?
		!up?
	end

	def self.upvote(user, post)
		Vote.create(user_id: user.id, post_id: post.id, value: 1)
	end

	def self.downvote(user, post)
		Vote.create(user_id: user.id, post_id: post.id, value: -1)
	end

end
