class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.available_for(current_user).with_search(params[:search]).page(params[:page]).per(3)
    @posts = @posts.includes(:tags).references(:tags)
    find_tags
  end

  def show
    if find_post
      @relative_posts = Post.limit_rand(5)
      @tags = @post.tags
    else
      redirect_to root_path, alert: 'Post not find!' unless @post
    end
  end

  def new
    @post = Post.new
    find_tags
  end

  def create
    @post = Post.new(Post.reject_blank(post_params))
    if @post.save
      redirect_to post_path(@post), notice: 'Post is successfully created!'
    else
      find_tags
      render :new
    end
  end

  def edit
    find_post
    find_tags
    render :new
  end

  def update
    find_post
    if @post.update_attributes!(post_params)
      redirect_to post_path(@post), notice: 'Post is successfully updated!'
    else
      render :edit
    end
  end

  def swich_state
    find_post
    @post.update_state(swich_params[:state])

    render nothing: true
  end

  private
  def find_post
    @post = Post.available_for(current_user).get_first(params[:id])
  end

  def find_tags
    @tags = Tag.all
  end

  def post_params
    params.require(:post).permit( :title, :body, :body_title, :title_img, :original, :status, tag_ids: [] )
  end

  def swich_params
    params.permit( :id, :state )
  end
end
