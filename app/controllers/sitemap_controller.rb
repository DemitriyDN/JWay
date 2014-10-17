class SitemapController < ApplicationController
  layout nil
  respond_to :xml

  def index
    @posts = Post.all
    respond_with(@posts)
  end
end
