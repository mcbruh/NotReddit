class Vote < ApplicationRecord
	belongs_to :user
	belongs_to :post

	def up?
		value == 1
	end

	def down?
		!up?
	end

	def self.up(user, post)
		Vote.create(user_id: user.id, post_id: post.id, value: 1)
	end

	def self.down(user, post)
		Vote.create(user_id: user.id, post_id: post.id, value: -1)
	end
end
