class Backend::HanPoetriesController < Backend::BaseController
  load_and_authorize_resource

  def index
    @q = HanPoetry.ransack(params[:q])
    @han_poetrys = @q.result.page(params[:page])
  end

  def new
  end

  def create
    @han_poetry.save

    respond_with @han_poetry, location: -> { [ :backend, HanPoetry ] }
  end

  def show
  end

  def edit
  end

  def update
    @han_poetry.update(han_poetry_params)

    respond_with @han_poetry, location: -> { [ :backend, @han_poetry ] }
  end

  def destroy
    @han_poetry.destroy

    respond_with @han_poetry, location: -> { [ :backend, HanPoetry ] }
  end

protected
  def han_poetry_params
    params.require(:han_poetry).permit(:title, :dynasty, :author, :prelude, :category, content: [], notes: [], translate: [], translate_res: [])
  end
end
