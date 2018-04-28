class TagsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:success] = "Tag created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:success] = "Successfully updated"
      redirect_to tags_path
    else
      render 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      flash[:success] = 'Successfully deleted'
      redirect_to tags_path
    else
      flash[:error] = "Could not delete"
      render 'index'
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end