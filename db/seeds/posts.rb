module UploadPosts
  def add_posts
    Post.populate 10 do |post|
      post.title      = Populator.words(2..6).titleize
      post.body       = Populator.sentences(15)
      post.body_title = Populator.sentences(3)
      post.created_at = 1.months.ago..Time.now
    end
  end

  def add_user
    User.create({ email: 'nick-supernick@gmail.com', password: 'password' })
  end

  module_function :add_posts, :add_user
end
