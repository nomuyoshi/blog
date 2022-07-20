class ApplicationController < ActionController::Base
  before_action :sidebar

  def sidebar
    @latest_articles = Article.published.limit(5)
    @category_tree = Category.hash_tree
  end
end
