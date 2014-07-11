class TagsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tags = Tag.order('name').page(params[:page]).per(10)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tags_params)

    if @tag.save
      redirect_to tags_path, notice: 'Tag created'
    else
      render 'new'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    render :new
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update_attributes(tags_params)

    redirect_to tags_path
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tags_path, notice: 'Tag was deleted!'
  end

  private
  def tags_params
    params.require(:tag).permit( :name )
  end
end
