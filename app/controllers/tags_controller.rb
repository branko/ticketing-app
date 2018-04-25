class TagsController < ApplicationController

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

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end