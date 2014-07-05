class Post < ActiveRecord::Base
  DISQUS_SHORTNAME = Rails.env == 'development' ? 'demitriydn'.freeze : "j-way-rails".freeze
end
