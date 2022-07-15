class Admin::ArticlesController < AdminController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @categories = Category.all
    @article = Article.new
  end

  def edit
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    if category_params[:category_ids].present?
      categories = Category.where(id: category_params[:category_ids])
      @article.categories = categories
    end

    if @article.save
      redirect_to admin_article_url(@article), notice: "Article was successfully created."
    else
      @categories = Category.all
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_article_url(@article), notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to admin_articles_url, notice: "Article was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :slug, :body, :published, :published_at, :eye_catching_image)
    end

    def category_params
      params.require(:article).permit(category_ids: [])
    end
end
