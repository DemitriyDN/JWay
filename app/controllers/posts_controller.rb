class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
    @tags = []
  end

  def show
    @post = Post.find(params[:id])
    @relative_posts = Post.limit(5)
    @tags = []
  end

  def new
    @post = Post.new
  end

  def create
    if Post.create(post_params)
      redirect_to root_path, notice: 'Post is successfully created!'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes!(post_params)
      redirect_to root_path, notice: 'Post is successfully updated!'
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit( :title, :body, :body_title, :status )
  end
end
