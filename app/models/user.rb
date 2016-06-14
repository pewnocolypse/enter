class User < ActiveRecord::Base
	attr_accessor :password
	

	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :name, :presence => true,
			  :length		   => { :maximum => 50}
	validates :email, :presence => true,
			  :format			=> { :with => email_regex },
			  :uniqueness		=> { :case_sensitive => false }
	validates :password, :presence => true,
			  :confirmation        => true,
			  :length			   => { :within => 6..40 }
	before_save :encrypt_password

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end

	def self.authentication( email, submitted_password) #User.authentification(......)
		user = find_by_email(email)

		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	private
		def encrypt_password
			#if its a new user
			self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") if self.new_record?
			#encrypter password field
			self.encrypted_password = encrypt(password)
		end

		#encrypt the password and combine wiht salt
		def encrypt(pass)
			Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
		end


	
end
