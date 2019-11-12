class Backend::TangPoemsController < Backend::BaseController
  def index
    @q = TangPoem.ransack(params[:q])
    @tang_poems = @q.result.page(params[:page])
  end

  def new
    @tang_poem = TangPoem.new
  end

  def create
    @tang_poem = TangPoem.new(tang_poem_params)
    @tang_poem.save

    respond_with @tang_poem, location: -> { [ :backend, TangPoem ] }
  end

  def show
    @tang_poem = TangPoem.find(params[:id])
  end

  def edit
    @tang_poem = TangPoem.find(params[:id])
  end

  def update
    @tang_poem = TangPoem.find(params[:id])
    @tang_poem.update(tang_poem_params)

    respond_with @tang_poem, location: -> { [ :backend, @tang_poem ] }
  end

  def destroy
    @tang_poem = TangPoem.find(params[:id])
    @tang_poem.destroy

    respond_with @tang_poem, location: -> { [ :backend, TangPoem ] }
  end

protected
  def tang_poem_params
    params.require(:tang_poem).permit(:title, :dynasty, :author, :prelude, :category, content: [], notes: [], translate: [], translate_res: [])
  end
end
