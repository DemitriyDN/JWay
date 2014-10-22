class Post < ActiveRecord::Base
  include Renderer

  has_and_belongs_to_many :tags

  before_save :render_body

  validates :url_link, presence: true
  validates :url_link, uniqueness: true

  DISQUS_SHORTNAME = Rails.env == 'development' ? 'demitriydn'.freeze : 'rails-junior'.freeze

  scope :sort_by_date, -> { order('created_at DESC') }
  scope :limit_rand, ->(num) { limit(num).order('RANDOM()') }
  scope :get_last_availible_id, -> { where(status: 1).last.id }
  scope :for_user, ->(user, page) { available_for(user).page(page).per(10).preload(:tags) }
  scope :available_for, -> (user) { user ? all : where(status: 1) }

  scope :by_url_link, ->(val) { where(url_link: val[:url_link]).first }
  scope :by_id, ->(val) { where(id: val[:post][:post_id]).first }

  enum status: {
    verification: 0,
    approved: 1
  }

  private
  def reindex!
    Sunspot.index!(self)
  end
end
