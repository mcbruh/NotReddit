class CommentsController < ApplicationController

	before_action :authenticate_user!, :find_commentable, :set_user

	def new
		@comment = Comment.new
	end

	def create
		@comment = @commentable.comments.new comment_params
		@comment.user_id = @user.id
		if @comment.save
			redirect_back, flash[:success] = "Comment posted"
		else
			redirect_back, flash[:failure] = "Failed to post"
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :user_id)
	end

	def set_user
		@user = current_user
	end

	def find_commentable
		@commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
		@commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
	end

end
