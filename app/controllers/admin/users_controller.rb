class Admin::UsersController < ApplicationController

	def index
	  @users = User.page(params[:page]).per(10)

	  @on_admin_page = true


	end

end
