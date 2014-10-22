module UploadProduction
  def add_posts
    post = Post.new
    post.title = 'Памятка!'
    post.url_link = 'img-fotki'
    post.title_img = 'http://img-fotki.yandex.ru/get/6746/268686932.0/0_e8534_a63027d2_orig.png'
    post.body_title = 'Я должен вас предупредить...'
    post.body = '
      <p>
        Я должен вас предупредить, некоторые из моих выводов / идей могут быть плохим или вовсе ошибочными.
        Публиковаться будет код, материалы или статьи которые я нахожу интересными, или просто те, которые мне понравились и
        счел их нужным перевести или опубликовать.
      </p>
    '
    post.status = 1
    post.original = nil
    post.save!
  end

  def add_highliter_post
    post = Post.new
    post.title = 'Памятка!'
    post.url_link = 'img-fotkiasasd'
    post.title_img = ''
    post.body_title = 'Syntax Highliter'
    post.body = <<-TEXT
      <p>
        Syntax Highliter
      </p>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus, commodi. Id atque commodi nisi cumque iste. Eum esse error fugiat doloribus odit. Sint libero dolores est laudantium, ratione deserunt dolorem.
      </p>
    TEXT

    post.status = 1
    post.original = nil
    post.save!
  end

  def add_tags
    tags = ['HTML', 'Searching', 'Search']

    tags.each do |tag|
      Tag.create!({ name: tag })
    end
  end

  def add_user
    User.create!({ email: 'nick-supernick@gmail.com', password: 'epyfnm' })
  end

  module_function :add_posts, :add_tags, :add_user, :add_highliter_post
end
