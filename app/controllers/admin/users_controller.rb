class Admin::UsersController < ApplicationController

	def index
	  @users = User.page(params[:page]).per(10)
	  @on_admin_page = true
	end

	def destroy
	  @user = User.find(params[:id])

	 	if @user.destroy
	 		DeleteUserMailer.goodbye_email(@user).deliver
		end
  	redirect_to admin_users_path
	end

end
