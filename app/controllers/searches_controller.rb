class SearchesController < ApplicationController
  def show
    @posts = Post.available_for(current_user).sort_by_date.page(params[:page]).per(10)
    @posts = @posts.includes(:tags).references(:tags)
    find_tags

    render 'posts/index'
  end
end
