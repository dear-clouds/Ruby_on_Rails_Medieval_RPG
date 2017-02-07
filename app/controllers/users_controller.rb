class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Bienvenue !"
			redirect_to @user
		else
			render 'new'
		end
	end

	def user_params
    params.require(:user).permit(:email, :password_hash, :password_salt, :password)
  end

end
