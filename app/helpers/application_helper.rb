module ApplicationHelper
  def page_title title_text
    content_for :title, "JWay - #{title_text}"
  end
end
