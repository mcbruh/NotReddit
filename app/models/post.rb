class Post < ApplicationRecord
	acts_as_commentable
	belongs_to :user
	has_many :comments, inverse_of: :post
	has_many :votes
	accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
end
