class SessionsController <ApplicationController
	def new
	end

	def create 
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			puts "HERE #1"
			session[:user_id] = user.id
			redirect_to root_url
		else
			puts "HERE #2"
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end

	end

	def destroy
		sign_out
		session[:user_id] = nil

		redirect_to signoutPage_path
	end
	def currentUser
		@currentUser || User.find_by_email(params[:email])
	end
	

	def logged_in
		!currentUser.nil?
	end

end