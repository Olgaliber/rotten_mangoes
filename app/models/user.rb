class User < ActiveRecord::Base

	has_many :reviews

	def has_secure_password
	end

	def full_name
	  "#{firstname} #{lastname}"
	end

end
