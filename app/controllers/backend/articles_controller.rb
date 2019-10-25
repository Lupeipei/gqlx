class Backend::ArticlesController < Backend::BaseController

  def index
    @articles = Article.all.limit(100)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      respond_with @article, location: [ :backend, Article ]
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
    if @article.update(article_params)
      respond_with @article, location: [ :backend, Article ]
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_with @article, location: [ :backend, Article ]
  end

protected
  def article_params
    params.require(:article).permit(:title, :dynasty, :author, :prelude, :content, :explanation)
  end
end
