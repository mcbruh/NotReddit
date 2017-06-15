class UpvotesController < ApplicationController
	before_action :authenticate_user!

	def create

	end

	def destroy

	end

	private

	def upvote_params
		params.require(:upvotes).permit(:user_id, :post_id, :value)
	end
	
end
