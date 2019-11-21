class Backend::TangPoemsController < Backend::BaseController
  load_and_authorize_resource

  def index
    @q = TangPoem.ransack(params[:q])
    @tang_poems = @q.result.page(params[:page])
  end

  def new
  end

  def create
    @tang_poem.save

    respond_with @tang_poem, location: -> { [ :backend, TangPoem ] }
  end

  def show
  end

  def edit
  end

  def update
    @tang_poem.update(tang_poem_params)

    respond_with @tang_poem, location: -> { [ :backend, @tang_poem ] }
  end

  def destroy
    @tang_poem.destroy

    respond_with @tang_poem, location: -> { [ :backend, TangPoem ] }
  end

protected
  def tang_poem_params
    params.require(:tang_poem).permit(:title, :dynasty, :author, :prelude, :category, content: [], notes: [], translate: [], translate_res: [])
  end
end
