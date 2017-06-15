class DownvotesController < ApplicationController
	before_action :authenticate_user!

	def create

	end

	def destroy

	end

	private

	def downvote_params
		params.require(:downvotes).permit(:user_id, :post_id, :value)
	end
	
end
