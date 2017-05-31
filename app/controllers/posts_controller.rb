class PostsController < ApplicationController

	before_action :set_current_user

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new(:user => @current_user)
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to post_path(@post)
	end

	def show
		@post = Post.find_by(:id => params[:id])
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
		params.require(:post).permit(:title, :content, :id, :user_id)
	end
end
