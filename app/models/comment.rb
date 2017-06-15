class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :commentable, polymorphic: true
	has_many :comments, :as => :commentable
	has_many :comment_upvotes
	validates :body, :presence =>  true
end
