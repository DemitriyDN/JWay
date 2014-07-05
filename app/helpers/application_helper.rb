module ApplicationHelper
  def page_title title_text
    content_for :title, "JWay - #{title_text}"
  end

  def comments_count post
    link_to '?', post_url(post, anchor: 'disqus_thread'), :"data-disqus-identifer" => post.id
  end



  class HTMLwithPygments < Redcarpet::Render::HTML
    require 'pygments.rb'
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def markdown(text, options = {})
    renderer = HTMLwithPygments.new(hard_wrap: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      space_after_headers: true,
      underline: true,
      highlight: true,
      quote: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end
