module ArticlesHelper
  def md2html(md)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, tables: true)
    markdown.render(md)
  end
end
