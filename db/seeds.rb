require 'faker'

[Post, User, Tag, Subscription].each(&:delete_all)

require Rails.root.join('db/seeds/upload_posts')
require Rails.root.join('db/seeds/upload_posts_production')

if Rails.env.development?
  UploadProduction.add_user
  UploadProduction.add_tags
  UploadProduction.add_posts
else
  UploadPosts.add_user
  UploadPosts.add_posts
  UploadPosts.add_tags
  UploadPosts.add_subscriptions
end

puts 'Load seeds complite!'
