class TicketsController < ApplicationController
  before_action :get_project_options, only: [:new, :edit, :create]

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:success] = "Created ticket"
      redirect_to project_path(Project.find(params[:ticket][:project_id]))
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params)
      flash[:success] = "Ticket updated"
      redirect_to project_path(@ticket.project_id)
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])

    if @ticket.destroy
      flash[:success] = "Ticket destroyed"
      redirect_to project_path(@ticket.project_id)
    else
      flash[:error] = "Could not delete"
      redirect_to projects_path
    end
  end

  private

  def get_project_options
    @project_options = Project.all.ids.map do |id|
      [Project.find(id).name, id]
    end
  end

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status, :project_id)
  end
end