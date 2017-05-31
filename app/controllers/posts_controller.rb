class PostsController < ApplicationController

	before_action :set_current_user

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new(:user => @current_user)
	end

	def create
		@post = @current_user.posts.build(post_params)
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def set_current_user
		@current_user = current_user
	end

	def post_params
		params.require(:post).permit(:title, :content, :user_id)
	end
end
