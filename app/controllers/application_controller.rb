class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def find_tags
    @tags = Tag.all
  end

  def find_post
    # @post = Post.available_for(current_user).find_by(url_link: params[:url_link])
    @post = Post.available_for(current_user).find(params[:id])

    redirect_to root_path, alert: 'Post not find!' unless @post
  end
end
