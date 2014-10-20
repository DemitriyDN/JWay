class Posts::Search
  class << self
    def by_query request
      ids = select_posts_ids_with_query(request)
      get_posts_by(ids)
    end

    private
    def select_posts_ids_with_query request
      query = generate_query(request)
      ActiveRecord::Base.connection.select_values(query)
    end

    def generate_query request
      formated_query = sanitize_request(request)
      sql_query(formated_query)
    end

    def sanitize_request req
      req.gsub(/[^A-Za-z \-]/, '').split.join(' & ')
    end

    def sql_query query
      <<-SQL
        SELECT pid
          FROM (SELECT p.id AS pid,
                       setweight(to_tsvector('russian', p.title), 'B') ||
                       setweight(to_tsvector('russian', p.body), 'C') ||
                       setweight(to_tsvector('russian', coalesce(string_agg(t.name, ' '))), 'A') AS document
                  FROM posts p
                    LEFT JOIN posts_tags pt ON p.id = pt.post_id
                    LEFT JOIN tags t ON t.id = pt.tag_id
                  GROUP BY p.id) p_search
          WHERE p_search.document @@ to_tsquery('russian', '#{query}')
          ORDER BY ts_rank(p_search.document, to_tsquery('russian', '#{query}')) DESC;
      SQL
    end

    def get_posts_by ids
      Post.where(id: ids)
    end
  end
end
