class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code code, data

    options = parse_options(data)

    str = Pygments.highlight(code, lexer: options['lang'], formatter: 'html')
    str = str.match(/<pre>(.+)<\/pre>/m)[1].to_s.gsub(/ *$/, '')
    #strip out divs <div class="highlight">
    tableized_code = tableize_code(str, options)
    tableize_code_wrapper(tableized_code, options)
  end

  def tableize_code (str, options)
    lang              = options['lang'] || 'plane'
    start_index       = (options['start_from'] || '1').to_i
    highlight_indexes = options['highlight'] || []
    show_numbers      = options['no_numbers']


    table = '<div class="highlight"><table><tr>'
    table += '<td class="line-numbers"><pre>' unless show_numbers
    code = ''


    str.lines.each_with_index do |line, index|
      line_index = index + start_index

      mark = ''
      if highlight_indexes.include? line_index.to_s
        is_marked = 'marked'
        is_start  = 'start' unless highlight_indexes.include? (line_index - 1).to_s
        is_end    = 'end'   unless highlight_indexes.include? (line_index + 1).to_s
        mark      = [is_marked, is_start, is_end].join(' ')
      end

      table += "<div data-line='#{ line_index }' class='line-number #{ mark }'></div>" unless show_numbers
      code  += "<div class='line #{ mark }'>#{line}</div>"
    end
    table += '</pre></td>' unless show_numbers
    table += "<td class='main #{lang}'><pre>#{code}</pre></td></tr></table></div>"
  end

  def tableize_code_wrapper(str, options)
    link  = options['link']
    title = options['title']

    source  = "<figure class='code'>"

    caption_start  = "<figcaption>#{title}"
    caption_link   = link ? " <a target='_blank' href='#{link}'>link</a>" : ""
    caption_finish = "</figcaption>"
    caption        = caption_start + caption_link + caption_finish

    source += caption if title

    source += str
    source += '</figure>'

    source
  end

  def parse_options data
    # data = 'lang===ruby###title===sssss###link===http://j.mp/pPUUmW###highlight===11,12,13,17,18###start_from===10'
    # no_numbers===true

    array_with_params = data.split('###').collect{|x| x.split('===')}
    # [["lang", "ruby"],
    # ["title", "sssss"],
    # ["link", "http//j.mp/pPUUmW"],
    # ["highlight", "11,13,17,18"],
    # ["start_from", "10"],
    # ["no_numbers", "true"],]

    parsed_hash = Hash[array_with_params]
    parsed_hash['title'] = parsed_hash['title'].split('_').join(' ') if parsed_hash['title']
    parsed_hash['highlight'] = parsed_hash['highlight'].split(',') if parsed_hash['highlight']

    # {"lang"=>"ruby", "title"=>"sssss", "link"=>"http://j.mp/pPUUmW", "highlight"=>["11", "13", "17", "18"], "start_from"=>"10", "no_numbers"=>"true"}
    parsed_hash
  end
end
