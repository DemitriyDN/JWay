module Renderer
  extend ActiveSupport::Concern

  private
  def render_body
    renderer  = HTMLwithPygments.new()
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    text      = sweep_code_blocks(self.body)

    self.rendered_body = redcarpet.render(text)
  end

  def extensions
    {
      highlight: true,
      underline: true,
      strikethrough: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      no_intra_emphasis: true
    }
  end

  def sweep_code_blocks text
    text.gsub( code_only ) do |unsafe_data|
      "<code> #{ERB::Util.html_escape($1)} </code>"
    end
  end

  def code_only
    /<code>(.*?)<\/code>/
  end
end
