module ApplicationHelper
  def page_title title_text
    content_for :title, "JWay - #{title_text}"
  end

  def comments_count post
    # link_to '?', post_url(post, anchor: 'disqus_thread'), :"data-disqus-identifer" => post.id
    3
  end
end
