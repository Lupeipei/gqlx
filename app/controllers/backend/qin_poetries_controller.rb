class Backend::QinPoetriesController < Backend::BaseController
  load_and_authorize_resource

  def index
    @q = QinPoetry.ransack(params[:q])
    @qin_poetrys = @q.result.page(params[:page])
  end

  def new
  end

  def create
    @qin_poetry.save

    respond_with @qin_poetry, location: -> { [ :backend, QinPoetry ] }
  end

  def show
  end

  def edit
  end

  def update
    @qin_poetry.update(qin_poetry_params)

    respond_with @qin_poetry, location: -> { [ :backend, @qin_poetry ] }
  end

  def destroy
    @qin_poetry.destroy

    respond_with @qin_poetry, location: -> { [ :backend, QinPoetry ] }
  end

protected
  def qin_poetry_params
    params.require(:qin_poetry).permit(:title, :dynasty, :author, :prelude, :category, content: [], notes: [], translate: [], translate_res: [])
  end
end
