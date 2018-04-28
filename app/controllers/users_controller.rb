class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if confirmed_password? && @user.save 
      binding.pry
      session[:user_id] = @user.id
      flash[:notice] = "User #{@user.name} created"
      redirect_to root_path
    else
      flash.now[:error] = "Could not create user."
      render :new
    end
  end


  private

  def confirmed_password?
    params[:user][:password] == params[:user][:password_confirmation]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end