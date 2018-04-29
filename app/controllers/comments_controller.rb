class CommentsController < ApplicationController

  def new
    
  end 

  def create
    @comment = Comment.new(comment_params)
    @ticket = Ticket.find_by id: params[:ticket_id]

    @comment.creator_id = current_user.id
    @comment.ticket_id = params[:ticket_id]

    if @comment.save
      flash[:notice] = "Comment created!"

      if @ticket.update(status: params[:status])
        flash[:notice] += "\nStatus changed to #{params[:status]}"
      else
        flash[:notice] += "\nStatus could not be changed"
      end

      redirect_to ticket_path(@ticket)
    else
      flash[:error] = "Comment could not be created"
      redirect_to ticket_path(@ticket)
    end
  end

  def edit
    @comment = Comment.find_by id: params[:id]
  end

  def update
    @comment = Comment.find_by id: params[:id]

    if @comment.update(comment_params)
      flash[:notice] = "Comment updated!"
      redirect_to ticket_path(@comment.ticket)
    else
      redirect_to ticket_path(@comment.ticket)
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id]).destroy
    flash[:notice] = "Comment destroyed"
    redirect_to ticket_path(comment.ticket)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end