class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates :title,
            :body,
            :body_title, presence: true

  DISQUS_SHORTNAME = Rails.env == 'development' ? 'demitriydn'.freeze : 'j-way-rails'.freeze

  enum status: {
    verification: 0,
    approved: 1
  }

  scope :by_date, -> { order('created_at DESC') }
  scope :available_for, -> (user) { user ? by_date : where(status: 1).by_date }
  scope :limit_rand, ->(num) { limit(num).order('RANDOM()') }
  scope :get_first, ->(id) { where('id= ?', id).first }

  def self.with_search query
    if query
      where('title like ?', "%#{query}%")
    else
      scoped
    end
  end

  def self.reject_blank param
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
end
