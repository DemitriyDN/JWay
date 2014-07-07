module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper

  def page_title title_text
    content_for :title, "JWay - #{title_text}"
  end

  def comments_count post
    link_to '?', post_url(post, anchor: 'disqus_thread'), :"data-disqus-identifer" => post.id
  end

  def original original_link
    if original_link
      link_to original_link, 'Original'
    else
      'No Original'
    end
  end

  def info_date date
    content_tag(:div, l(date) , class: 'date')
  end

  def tags_displaying tags
    content_tag(:ul, class: 'tags') do
      tags.each do |item|
        concat content_tag(:li, link_to(item.name, '#') )
      end
    end
  end

  def approve_switch user, post
    if user
      check_box_tag 'post_switcher' , :status , post.approved?,  data: { 'id' => post.id } ,class: 'activate-article'
    end
  end
end
