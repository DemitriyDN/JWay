class SearchesController < ApplicationController
  def show
    @posts = Search.posts_by_query(params[:search]).available_for(current_user)
    @posts = @posts.page(params[:page]).per(10).eager_load(:tags)

    find_tags
    render 'posts/index'
  end
end
