class Backend::ArticlesController < Backend::BaseController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to works_path
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
      redirect_to works_path
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
  end

protected
  def article_params
    params.require(:article).permit(:title, :dynasty, :author, :prelude, :content, :explanation)
  end
end
