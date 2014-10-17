class SearchesController < ApplicationController
  def show
    @posts = Search.find_posts_by_query(params[:search])

    find_tags
    render 'posts/index'
  end
end
