module Renderer
  extend ActiveSupport::Concern

  private
  def render_body
    extensions = {
      quote: true,
      highlight: true,
      underline: true,
      strikethrough: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      no_intra_emphasis: true
    }

    renderer = HTMLwithPygments.new()
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    self.rendered_body = redcarpet.render(self.body)
  end
end
