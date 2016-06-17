class UsersController < ApplicationController
  
  def index
    
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @pictures = Picture.all
  end

  def new
  	@user = User.new
  end
  def create
    passwords_match = user_params[:password] == user_params[:password_confirmation]
  	@user = User.new(user_params.except(:password_confirmation))

  	
    if passwords_match && @user.save
  		redirect_to root_url, notice: 'User was successfully created.'
  	else
  		render action: "new"
  	end
  end
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :followers)
    end

end
