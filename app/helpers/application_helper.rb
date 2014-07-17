module ApplicationHelper
  def page_title title_text
    content_for :title, "JWay - #{title_text}"
  end

  def comments_count post
    link_to '?', post_url(post, anchor: 'disqus_thread'), :"data-disqus-identifer" => post.id
  end

  def original original_link
    if original_link.present?
      link_to original_link, 'Original'
    else
      'No Original'
    end
  end

  def info_date date
    content_tag(:div, l(date) , class: 'date')
  end

  def tags_displaying tags, in_post = false
    content_tag(:ul, class: in_post ? 'post_tags' : 'tags') do
      tags.each do |tag|
        concat content_tag(:li, link_to( tag.name, posts_path(search: tag.name )))
      end
    end
  end

  def approve_switch user, post
    if user
      check_box_tag 'post_switcher' , :status , post.approved?,  data: { 'id' => post.id }, class: 'activate-article'
    end
  end

  def markdown content
    content.html_safe
  end
end
