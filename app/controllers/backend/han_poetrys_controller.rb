class Backend::HanPoetrysController < Backend::BaseController
  def index
    @han_poetrys = HanPoetry.page(params[:page]).per(10)
  end

  def new
    @han_poetry = HanPoetry.new
  end

  def create
    @han_poetry = HanPoetry.new(han_poetry_params)
    @han_poetry.save

    respond_with @han_poetry, location: -> { [ :backend, HanPoetry ] }
  end

  def show
    @han_poetry = HanPoetry.find(params[:id])
  end

  def edit
    @han_poetry = HanPoetry.find(params[:id])
  end

  def update
    @han_poetry = HanPoetry.find(params[:id])
    @han_poetry.update(han_poetry_params)

    respond_with @han_poetry, location: -> { [ :backend, @han_poetry ] }
  end

  def destroy
    @han_poetry = HanPoetry.find(params[:id])
    @han_poetry.destroy

    respond_with @han_poetry, location: -> { [ :backend, HanPoetry ] }
  end

protected
  def han_poetry_params
    params.require(:han_poetry).permit(:title, :dynasty, :author, :prelude, :category, content: [], notes: [], translate: [], translate_res: [])
  end
end
