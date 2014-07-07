class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.available_for(current_user).page(params[:page]).per(3)
    @tags  = Post.tag_counts_on(:tags)
  end

  def show
    # User can view this post?

    if find_post
      @relative_posts = @post.find_related_tags.limit_rand(5)
      @tags = @post.tags
    else
      redirect_to root_path, alert: 'Post not find!' unless @post
    end
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: 'Post is successfully created!'
    else
      @tags = Tag.all
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

  def swich_state
    find_post
    if swich_params[:state] == 'true'
      @post.approved!
    else
      @post.verification!
    end

    render nothing: true
  end

  private
  def find_post
    @post = Post.available_for(current_user).get_first(params[:id])
  end

  def post_params
    params.require(:post).permit( :title, :body, :body_title, :original, :status, tag_list: [] )
  end

  def swich_params
    params.permit( :id, :state )
  end
end
