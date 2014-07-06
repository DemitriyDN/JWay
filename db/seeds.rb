require 'populator'
require 'faker'

[Post].each(&:delete_all)

require Rails.root.join('db/seeds/posts')

UploadPosts.add_user
UploadPosts.add_posts

puts 'Load seeds complite!'
