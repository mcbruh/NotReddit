class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :commentable, polymorphic: true
	has_many :comments, :as => :commentable
	validates :body, :presence =>  true
	acts_as_votable

	def karma
		upvotes = self.get_upvotes.size
		downvotes = self.get_downvotes.size
		karma = upvotes - downvotes
		karma
	end
	
end
