class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    # @posts = Post.published.page(params[:page]).per(3)
    @posts = Post.published.page(params[:page]).per(3)
    @tags = Tag.all
  end

  def show
    # @tom.find_related_skills # => [<User name="Bobby">, <User name="Frankie">]

    find_post
    @relative_posts = Post.limit(5)
    @tags = @post.tags
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
    find_post
  end

  def update
    find_post
    if @post.update_attributes!(post_params)
      redirect_to root_path, notice: 'Post is successfully updated!'
    else
      render :edit
    end
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit( :title, :body, :body_title, :status )
  end
end
