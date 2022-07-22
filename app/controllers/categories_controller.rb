class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:slug])
    @articles = @category.articles.published.page(params[:page])
    @tree = @category.ancestors
  end
end
