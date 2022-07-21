class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:categories).published
  end

  def show
    @article = Article.find_by(slug: params[:slug])
    @categories = @article.categories
    # 複数カテゴリある場合、lastの階層を使う
    @tree = @categories.last.ancestors
  end
end
