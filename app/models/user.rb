class User < ActiveRecord::Base
	def self.find_by_email(email)
		self.find_by(email: email)
	end

	def authenticate(password)
		return self.password == password
	end
end
