class Upvote < ApplicationRecord
	belongs_to :user
	belongs_to :post

	def self.destroy_vote(user, post)
		current_vote = Vote.where(user_id: user.id).where(post_id: post.id)
		current_vote.destroy if current_vote
	end

	def self.delete_vote(user, post)
		destroy_vote(user, post)
	end

end
