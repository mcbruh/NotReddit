class CommentUpvotesController < ApplicationController
	before_action :authenticate_user!

	def create

	end

	def destroy

	end

	private

	def comment_upvote_params
		params.require(:comment_upvotes).permit(:user_id, :comment_id, :value)
	end
	
end
