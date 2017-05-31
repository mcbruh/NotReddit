class CommentsController < ApplicationController

	def index
		if params[:user_id]
			@user = User.find_by(id: params[:user_id])
			@comments = @user.comments
		end
	end

	def new
		@comment = Comment.new(:user => @current_user)
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def comment_params
		
	end

end
