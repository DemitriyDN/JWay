class Posts::SearchesController < ApplicationController
  def show
    @posts = Posts::Search.by_query(params[:search]).for_user(current_user, params[:page])

    find_tags
    render 'posts/index'
  end
end
