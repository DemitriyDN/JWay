module UploadPosts
  def add_posts
    Post.populate 100 do |post|
      post.title   = Populator.words(2..3).titleize
      post.body    = Populator.sentences(5)
      post.created_at = 1.months.ago..Time.now
    end
  end

  module_function :add_posts
end
