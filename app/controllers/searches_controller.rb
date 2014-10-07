class SearchesController < ApplicationController
  def show
    @query = Post.search(include: [:tags]) do
      fulltext params[:search]
      order_by :created_at, :desc
      paginate page: params[:page], per_page: 10
      with(:status).equal_to('approved')
    end

    @posts = @query.results

    find_tags

    render 'posts/index'
  end
end
