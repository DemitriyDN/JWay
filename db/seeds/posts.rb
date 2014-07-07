module UploadPosts
  def add_posts
    Post.populate 20 do |post|
      post.title = Populator.words(2..6).titleize
      post.body_title = Populator.sentences(3)
      post.body = Populator.sentences(15)
      post.status = 1
      post.original = nil
    end
  end

  def add_user
    User.create!({ email: 'nick-supernick@gmail.com', password: 'password' })
  end

  def add_tags
    tags = ['rake', 'rack', 'sublime', 'rails', 'ruby', 'sql']
    tags.each do |tag|
      Tag.create({ name: tag })
    end

    Post.all.each do |post|
      # post.tag_list.add('sublime, rails', parse: true)
      post.tag_list.add( tags.sample )
      post.save!
    end
  end

  module_function :add_posts, :add_user, :add_tags
end
