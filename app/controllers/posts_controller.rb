class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_current_user

	def index
		@posts = Post.all
	end

	def new
		@post = @current_user.posts.build
	end

	def create
		@post = @current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post created"
			redirect_to post_path(@post)
		else
			flash[:failure] = "Post failed to create"
			redirect_to new_post_path
		end
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
		params.require(:post).permit(:title, :content, :user_id)
	end

end
