require 'populator'
require 'faker'

[].each(&:delete_all)

require Rails.root.join('db/seeds/posts')

# UploadPosts.add_posts

puts 'Load seeds complite!'
