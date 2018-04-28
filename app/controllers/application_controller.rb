class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def index
    @projects = Project.all
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless session[:user_id]
      flash[:notice] = "You must be logged in to do that"
      redirect_to root_path
    end
  end
end
