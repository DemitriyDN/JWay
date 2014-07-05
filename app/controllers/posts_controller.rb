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
end
