module UploadProduction
  def add_posts
    post = Post.new
    post.title = 'Памятка!'
    post.title_img = 'http://img-fotki.yandex.ru/get/6746/268686932.0/0_e8534_a63027d2_orig.png'
    post.body_title = 'Я должен вас предупредить...'
    post.body = '
      <p>
        Я должен вас предупредить, некоторые из моих выводов / идей могут быть плохим или вовсе ошибочными.
        Публиковаться будет код, материалы или статьи которые я нахожу интересными, или просто те, которые мне понравились и
        счел их нужным перевести или опубликовать.
      </p>
      <p>
        Не надо строго относится к статьям в этом блоге, я не претендую на абсолютные знания в какой бы
        то ни было категории знаний ( даже в русском языке вы найдете много ошибок ;) ).
      </p>
      <p>
      Если вы заметили ошибку либо заблуждение, вы всегда можете сообщить об этом в комментариях или просто
        написать об этом на мой jway-rails@gmail.com
      </p>
      <p>
        Также если вам понравилась какая-то статья и вы хотите поделиться ею с автором сайта - то пожалуйста
            скидывайте ее по заданному емайлу:
        <a href="mailto:j.way.rails@gmail.com">j.way.rails@gmail.com</a>
      </p>
    '
    post.status = 0
    post.original = nil
    post.save!
  end

  def add_tags
    tags = ['HTML', 'CSS', 'Rake', 'Rack', 'Sublime', 'Ruby On Rails', 'Ruby', 'SQL',
            'ActiveRecord', 'TDD', 'RSpec', 'JavaScript', 'Git', 'Gem', 'RVM', 'jQuery']

    tags.each do |tag|
      Tag.create!({ name: tag })
    end
  end

  def add_user
    User.create!({ email: 'nick-supernick@gmail.com', password: 'password' })
  end

  module_function :add_posts, :add_tags, :add_user
end
