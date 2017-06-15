class UpvotesController < ApplicationController
	before_action :authenticate_user!

	def create
		@upvote = Upvote.new
		@upvote.user_id = current_user.id
		@upvote.post_id = params[:post_id]
		if @upvote.save
			redirect_back fallback_location: root_path
		end
	end

	def destroy

	end

	private

	def upvote_params
		params.require(:upvotes).permit(:user_id, :post_id, :value)
	end

end
