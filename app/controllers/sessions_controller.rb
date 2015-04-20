class SessionsController < ApplicationController
  def new
  	# we dont need to instantiate anything here 
  	# because were not adding a new user
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to products_url, :notice => "Logged in!"
  	else
  		flash.now[:alert] = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to products_url, notice: "Logged out!"
  end
end
