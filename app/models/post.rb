class Post < ActiveRecord::Base
  acts_as_taggable_on :tags

  DISQUS_SHORTNAME = Rails.env == 'development' ? 'demitriydn'.freeze : "j-way-rails".freeze

  enum status: {
    verification: 0,
    approved: 1,
    done: 2
  }

  default_scope { order('created_at DESC') }
  scope :published, -> { where(status: 2) }
end
