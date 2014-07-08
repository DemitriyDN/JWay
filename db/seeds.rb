require 'faker'

[Post, User, Tag, Subscription].each(&:delete_all)

require Rails.root.join('db/seeds/posts')

UploadPosts.add_user
UploadPosts.add_posts
UploadPosts.add_tags
UploadPosts.add_subscribers

puts 'Load seeds complite!'
