class SitemapController < ApplicationController
  layout nil

  def index
    @posts = Post.by_date

    respond_to do |format|
      format.xml
    end
  end
end
