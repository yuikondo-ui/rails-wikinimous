class ApplicationController < ActionController::Base
  # Read
  # See all articles
  def index
      @articles = Article.all
  end
  # See details about one article
  def show
      @article = Article.find(params[:id])
  end
  # Create a restaurant
  def new
      @article = Article.new # needed to instantiate the form_for
  end

  def create
      @article = Article.new(article_params) 
      # DIFF taks_params & params[:article]
      @article.save
      # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to article_path(@article)
  end

  # Update a restaurant
  def edit
      @article = Article.find(params[:id])
  end

  def update
      @article = Article.find(params[:id])
      @article.update(article_params)
      redirect_to article_path(@article)
  end
  # Destroy a restaurant

  def destroy
      @article = Article.find(params[:id])
      @article.destroy

      redirect_to articles_path
  end

  private

  def article_params
      params.require(:article).permit(:title, :content)
  end
end
