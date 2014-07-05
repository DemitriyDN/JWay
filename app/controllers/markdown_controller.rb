class MarkdownController < ApplicationController
  layout false

  def preview
    @body = params[:data]
  end
end
