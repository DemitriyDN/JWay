class SearchesController < ApplicationController
  def show
    @posts = Search.posts_by_query(params[:search]).for_user(current_user, params[:page])

    find_tags
    render 'posts/index'
  end
end
