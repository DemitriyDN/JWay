class Post < ActiveRecord::Base
  acts_as_taggable_on :tags

  validates :title,
            :body,
            :body_title, presence: true

  DISQUS_SHORTNAME = Rails.env == 'development' ? 'demitriydn'.freeze : 'j-way-rails'.freeze

  enum status: {
    verification: 0,
    approved: 1
  }

  scope :by_date, -> { order('created_at DESC') }
  scope :published, -> (user) { user ? by_date : where(status: 1).by_date }
  scope :limit_rand, ->(num) { limit(num).order('RANDOM()') }
end
