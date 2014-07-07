module UploadPosts
  def add_posts
    tags_names = Tag.pluck(:name)

    Post.populate 20 do |post|
      post.title = Populator.words(2..6).titleize
      post.body_title = Populator.sentences(3)
      post.body = Populator.sentences(15)
      post.status = 2
      post.original = nil
    end

    Post.all.each do |post|
      post.tag_list.add(tags_names.sample)
      post.save!
    end
  end

  def add_user
    User.create!({ email: 'nick-supernick@gmail.com', password: 'password' })
  end

  def add_tags
    ['sublime', 'rake', 'rails', 'ruby'].each do |tag|
      Tag.create!({ name: tag })
    end
  end

  module_function :add_posts, :add_user, :add_tags
end
