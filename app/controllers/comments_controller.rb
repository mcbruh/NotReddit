class CommentsController < ApplicationController
	before_action :authenticate_user!, :find_commentable, :set_user

	def new
		@comment = Comment.new
	end

	def create
		@comment = @commentable.comments.new(comment_params)
		@comment.user_id = @user.id
		@comment.post_id = params[:post_id]
		if @comment.save
			redirect_back fallback_location: root_path
		else
			redirect_back fallback_location: root_path
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		@comment.update
		redirect_back fallback_location: root_path
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_back fallback_location: root_path
	end

	def upvote
		comment = Comment.find(params[:id])
		comment.upvote_by(current_user)
		redirect_back fallback_location: root_path
	end

	def downvote
		comment = Comment.find(params[:id])
		comment.downvote_by(current_user)
		redirect_back fallback_location: root_path
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :user_id, :post_id)
	end

	def set_user
		@user = current_user
	end

	def find_commentable
		@commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
		@commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
	end

end
