class ProjectsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @tickets = Ticket.all.where(project_id: params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:success] = "Project updated"
      redirect_to project_path(params[:id])
    else

    end
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = "Project saved"
      redirect_to projects_path
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    
    if @project.destroy
      flash[:success] = "Project #{params[:id]} deleted"
      @project.destroy
      redirect_to projects_path
    else 
      flash[:error] = "Project could not be deleted"
      render :index
    end
    
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end