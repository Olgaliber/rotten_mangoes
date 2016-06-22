class Admin::UsersController < ApplicationController
	def index
	  @users = User.all

	  @on_admin_page = true


	end

end
