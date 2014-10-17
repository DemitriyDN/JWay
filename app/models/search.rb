class Search
  class << self
    def self.find_posts_by_query request
      ids = select_posts_ids_with_query(request)
      get_posts_by(ids)
    end

    private
    def self.select_posts_ids_with_query request
      query = generate_query(request)
      ActiveRecord::Base.connection.select_values(query)
    end

    def self.generate_query request
      formated_query = sanitize_request(request)
      sql_query(formated_query)
    end

    def self.sanitize_request req
      # And complit to form: 'xxxx & yyy'
      req # Some sanitizetion...
    end

    def self.sql_query query
      <<-SQL
        SELECT pid
          FROM (SELECT p.id AS pid,
                       setweight(to_tsvector('russian', p.title), 'B') ||
                       setweight(to_tsvector('russian', p.body), 'C') ||
                       setweight(to_tsvector('russian', coalesce(string_agg(t.name, ' '))), 'A') AS document
                  FROM posts p
                    JOIN posts_tags pt ON pt.post_id = pt.tag_id
                    JOIN tags t ON t.id = pt.tag_id
                  GROUP BY p.id) p_search
          WHERE p_search.document @@ to_tsquery('russian', #{query})
          ORDER BY ts_rank(p_search.document, to_tsquery('russian', #{query})) DESC;
      SQL
    end

    def self.get_posts_by ids
      Post.find(array_of_ids)
    end
  end
end
