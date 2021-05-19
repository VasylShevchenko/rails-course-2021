class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def my_articles
    @articles = current_user.articles.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to article_path(@article), notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find_by(id: params['id'])
  end

  def update
    @article = Article.find_by(id: params['id'])
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = current_user.articles.find_by(id: params['id'])
    @article.destroy
    redirect_to articles_path, notice: "Article was successfully destroyed."
  end

  private

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
