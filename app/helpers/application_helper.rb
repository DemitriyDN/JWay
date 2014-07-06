module ApplicationHelper
  def page_title title_text
    content_for :title, "JWay - #{title_text}"
  end

  def comments_count post
    link_to '?', post_url(post, anchor: 'disqus_thread'), :"data-disqus-identifer" => post.id
  end

  def original original_link
    # <a href=''>No Original</a>
  end

  def info_date date
    content_tag(:div, l(date) , class: 'date')
  end
end
