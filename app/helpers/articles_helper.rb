module ArticlesHelper
  def md2html(md)
    markdown = Redcarpet::Markdown.new(Redcarpet::CustomRender, tables: true)
    markdown.render(md)
  end
end
