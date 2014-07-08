module UploadPosts
  def add_posts
    20.times do
      post = Post.new
      post.title = Faker::Lorem.sentence.titleize
      post.body_title = Faker::Lorem.sentence(3)
      post.body = Faker::Lorem.sentence(15)
      post.status = 1
      post.original = nil
      post.save!
    end
  end

  def add_user
    User.create!({ email: 'nick-supernick@gmail.com', password: 'password' })
  end

  def add_tags
    tags = ['rake', 'rack', 'sublime', 'rails', 'ruby', 'sql']
    tags.each do |tag|
      Tag.create!({ name: tag })
    end

    Post.all.each do |post|
      post.tags << Tag.all.sample
      post.save!
    end
  end

  def add_subscriptions
    20.times do
      subscriber = Subscription.new
      subscriber.email = Faker::Internet.email
      subscriber.last_id = 1
      subscriber.save!
    end
  end

  module_function :add_posts, :add_user, :add_tags, :add_subscriptions
end
