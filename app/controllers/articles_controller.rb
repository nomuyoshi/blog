class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:categories).published
  end

  def show
    @article = Article.find_by(slug: params[:slug])
    @categories = @article.categories
    @tree = []
    if @categories.present?
      @tree = @categories.last.ancestors # 複数カテゴリある場合、lastの階層を使う
    end
  end
end
