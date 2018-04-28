class SessionsController < ApplicationController
  def new

  end
  
  def create
    user = User.where(name: params[:username]).first

    if user && user.authenticate(params[:password])
      flash[:notice] = "You have logged in!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to root_path
  end 
end