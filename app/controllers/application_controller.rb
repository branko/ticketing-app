class ApplicationController < ActionController::Base
  def index
    @projects = Project.all
  end
end
