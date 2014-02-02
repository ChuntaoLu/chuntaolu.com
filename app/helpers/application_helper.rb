module ApplicationHelper
  #refer to redcarpet documentation
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      options = { :lineanchors => true }
      begin
        Pygments.highlight(code, :lexer => language, options: options)
      rescue
        Pygments.highlight(code, :lexer => :text, options: options)
      end
    end
  end

  def markdown(text)
    render_options = { hard_wrap: true }
    renderer = HTMLwithPygments.new(render_options)
    extensions = { autolink: true,
                   space_after_headers: true,
                   fenced_code_blocks: true,
                   no_intra_emphasis: true,
                   strikethrough: true,
                   superscript: true,
                   footnotes: true }
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end

  def date_string(date, year=false)
    format = year ? '%b %d %Y' : '%b %d'
    date.strftime(format)
  end

  def title(page_title)
    content_for(:title) do
      page_title.blank? ? 'Chuntao Lu' : page_title + ' | Chuntao Lu'
    end
  end

  def read_more(article)
    output = truncate_html(markdown(article.body), length: 500, omission: '...')
    output += link_to('Read More>>', article_path(article)) if markdown(article.body).size > 500
    output.html_safe
  end

  def active?(path)
    request.path.start_with?(path) ? 'active' : ''
    #current_page?(path) ? 'active' : ''
  end
end
