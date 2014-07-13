require 'faker'

[Post, User, Tag, Subscription].each(&:delete_all)

require Rails.root.join('db/seeds/upload_posts_production')

UploadProduction.add_user
UploadProduction.add_tags
UploadProduction.add_posts
UploadProduction.add_highliter_post

puts 'Load seeds complite!'
