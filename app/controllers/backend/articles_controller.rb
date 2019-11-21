class Backend::ArticlesController < Backend::BaseController
  load_and_authorize_resource

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result.page(params[:page])
  end

  def new
  end

  def create
    @article.save

    respond_with @article, location: -> { [ :backend, Article ] }
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)

    respond_with @article, location: -> { [ :backend, @article ] }
  end

  def destroy
    @article.destroy

    respond_with @article, location: -> { [ :backend, Article ] }
  end

protected
  def article_params
    params.require(:article).permit(:title, :dynasty, :author, :prelude, :category, content: [], notes: [], translate: [], translate_res: [])
  end
end
