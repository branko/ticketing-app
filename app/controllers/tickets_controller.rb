class TicketsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
    @projects = Project.all
    @tags = Tag.all
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
    @tags = Tag.all
    @projects = Project.all
    @ticket = Ticket.find(params[:id])
    @currentTagIds = @ticket.tags.ids
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
    Ticket.destroy(params[:id])
    flash[:success] = "Ticket successfully destroy"
    redirect_to root_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status, :project_id, tag_ids: []).merge(creator: session[:user_id])
  end
end