class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.available_for(current_user).with_search(params[:search]).page(params[:page]).per(10)
    @posts = @posts.includes(:tags).references(:tags)
    find_tags
    render_index
  end

  def show
    if find_post
      @relative_posts = Post.limit_rand(5)
      @tags = @post.tags
      render_show
    else
      redirect_to root_path, alert: 'Post not find!' unless @post
    end
  end

  def new
    @post = Post.new
    find_tags
    render_new
  end

  def create
    @post = Post.new(Post.reject_blank(post_params))
    if @post.save
      redirect_to post_path(@post), notice: 'Post is successfully created!'
    else
      find_tags
      render_new
    end
  end

  def edit
    find_post
    find_tags
    render_new
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
  # TODO: Need to refactor this part of private methods
  def find_post
    @post = Post.available_for(current_user).get_first(params[:id])
  end

  def find_tags
    @tags = Tag.by_name
  end

  def post_params
    params.require(:post).permit( :title, :meta, :body, :body_title, :title_img, :original, :status, tag_ids: [] )
  end

  def swich_params
    params.permit( :id, :state )
  end

  def render_new
    render 'posts/new/new'
  end

  def render_show
    render 'posts/show/show'
  end

  def render_index
    render 'posts/index/index'
  end
end
