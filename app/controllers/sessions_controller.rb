class SessionsController < ApplicationController
	def new		
		@user
	end

	# Method to log user in, will pass if user exists and password is correct
	def create
		user = User.find_by_username(params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to guests_path
		else
			# if user does not exist or password is incorrect, show error message
			flash[:alert] = "Incorrect username or password"
			redirect_to new_user_path
		end
	end

	# Method to log user out and redirect to login page
	def destroy
		session[:user_id] = nil
		redirect_to guests_path
	end

end
