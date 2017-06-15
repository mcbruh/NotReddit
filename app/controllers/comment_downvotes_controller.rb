class CommentDownvotesController < ApplicationController
	before_action :authenticate_user!

	def create

	end

	def destroy

	end

	private

	def comment_downvote_params
		params.require(:comment_downvotes).permit(:user_id, :comment_id, :value)
	end
	
end
