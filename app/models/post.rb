class Post < ActiveRecord::Base
  DISQUS_SHORTNAME = Rails.env == 'development' ? 'demitriydn'.freeze : "j-way-rails".freeze

  enum status: {
    verification: 0,
    approved: 1,
    done: 2
  }

end
