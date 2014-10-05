class SitemapController < ApplicationController
  layout nil

  def index
    @posts = Post.all

    respond_to do |format|
      format.xml
    end
  end
end
