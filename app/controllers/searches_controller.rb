class SearchesController < ApplicationController
  def show
    @query = Post.search(include: [:tags]) do
      # TODO:  not use full text search!  keywords???
      fulltext params[:search]
      order_by :created_at, :desc
      paginate page: params[:page], per_page: 10
    end

    @posts = @query.results

    find_tags

    render 'posts/index'
  end
end
