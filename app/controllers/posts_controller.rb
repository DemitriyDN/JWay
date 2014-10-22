class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update]

  def index
    @posts = Post.sort_by_date.for_user(current_user, params[:page])
    @posts = @posts
    find_tags
  end

  def show
    @relative_posts = Post.limit_rand(5)
    @tags = @post.tags
  end

  def new
    @post = Post.new
    find_tags
  end

  def create
    @post = Post.new(Tag.reject_blank_from(post_params))
    if @post.save
      redirect_to post_path(@post.url_link), notice: 'Post is successfully created!'
    else
      find_tags
      render :new
    end
  end

  def edit
    find_tags
    render :new
  end

  def update
    if @post.update_attributes(post_params)
      # asdasdasd

      redirect_to post_path(@post.url_link), notice: 'Post is successfully updated!'
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit( :title, :meta, :body, :body_title, :title_img, :original, :url_link, :status, tag_ids: [] )
  end
end
