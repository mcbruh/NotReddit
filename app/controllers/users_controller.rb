class UsersController < ApplicationController

	def show
		render "users/profile"
		@user = User.find(params[:id])
	end

end
