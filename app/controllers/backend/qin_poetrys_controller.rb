class Backend::QinPoetrysController < Backend::BaseController
  def index
    @qin_poetrys = QinPoetry.page(params[:page]).per(10)
  end

  def new
    @qin_poetry = QinPoetry.new
  end

  def create
    @qin_poetry = QinPoetry.new(qin_poetry_params)
    @qin_poetry.save

    respond_with @qin_poetry, location: -> { [ :backend, QinPoetry ] }
  end

  def show
    @qin_poetry = QinPoetry.find(params[:id])
  end

  def edit
    @qin_poetry = QinPoetry.find(params[:id])
  end

  def update
    @qin_poetry = QinPoetry.find(params[:id])
    @qin_poetry.update(qin_poetry_params)

    respond_with @qin_poetry, location: -> { [ :backend, @qin_poetry ] }
  end

  def destroy
    @qin_poetry = QinPoetry.find(params[:id])
    @qin_poetry.destroy

    respond_with @qin_poetry, location: -> { [ :backend, QinPoetry ] }
  end

protected
  def qin_poetry_params
    params.require(:qin_poetry).permit(:title, :dynasty, :author, :prelude, content: [], notes: [], translate: [], translate_res: [])
  end
end
