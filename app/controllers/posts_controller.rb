class PostsController < ApplicationController
	before_action :authenticate_user!

	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.build
	end

	def links
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

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

	def upvote
		@post = Post.find(params[:id])
		@post.upvote_by(current_user)
		redirect_back fallback_location: root_path
	end

	def downvote
		@post = Post.find(params[:id])
		@post.downvote_by(current_user)
		redirect_back fallback_location: root_path
	end

	private


	def post_params
		params.require(:post).permit(:title, :body, :url, :user_id)
	end

end
