module ApplicationHelper
  #refer to redcarpet documentation
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, :lexer => language,
                         options: { :lineanchors => true })
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
end
