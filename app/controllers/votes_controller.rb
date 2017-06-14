class VotesController < ApplicationController
	before_action :authenticate_user!

	def create

	end

	def destroy

	end

	def upvote

	end

	def downvote

	end

	private

	def vote_params
		params.require(:votes).permit(:user_id, :post_id)
	end

end
