class User < ActiveRecord::Base

	has_many :reviews

	def has_secure_password
	end

end
