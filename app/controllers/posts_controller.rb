class PostsController < ApplicationController
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
    if @post.create(post_params)
      redirect root_path, notice: 'Post is successfully created!'
    else
      render :new
    end
  end

  # def edit
  # end

  # def udpate
  # end

  private
  def post_params
    params.require(:post).permit( :title, :body, :body_title, :status )
  end
end
