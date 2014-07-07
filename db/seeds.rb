require 'populator'
require 'faker'

[Post, User, Tag].each(&:delete_all)

require Rails.root.join('db/seeds/posts')

UploadPosts.add_user
UploadPosts.add_posts
UploadPosts.add_tags

puts 'Load seeds complite!'
