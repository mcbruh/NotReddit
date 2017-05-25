class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :comment_downvotes
	has_many :comment_upvotes
end
