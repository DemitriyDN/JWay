class Post < ActiveRecord::Base
  include Renderer

  has_and_belongs_to_many :tags

  before_save :render_body

  DISQUS_SHORTNAME = Rails.env == 'development' ? 'demitriydn'.freeze : 'rails-junior'.freeze

  enum status: {
    verification: 0,
    approved: 1
  }

  def self.reject_blank_tags param
    param[:tag_ids] = param[:tag_ids].reject(&:empty?)
    param
  end

  def update_state state
    if state == 'true'
      self.approved!
    else
      self.verification!
    end
  end

  def to_param
    "#{id}-#{title}".parameterize
  end

  private
  def reindex!
    Sunspot.index!(self)
  end
end
