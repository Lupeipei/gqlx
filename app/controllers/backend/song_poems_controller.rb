class Backend::SongPoemsController < Backend::BaseController

  def index
    @song_poems = SongPoem.all
  end

  def new
    @song_poem = SongPoem.new
  end

  def create
    @song_poem = SongPoem.new(song_poem_params)
    if @song_poem.save
      flash[:notice] = "created success!"
      redirect_to backend_song_poems_path
    else
      flash[:alert] = "something wrong!"
      render :new
    end
  end

  def show
    @song_poem = SongPoem.find(params[:id])
  end

  def edit
    @song_poem = SongPoem.find(params[:id])
  end

  def update
    @song_poem = SongPoem.find(params[:id])
    if @song_poem.update(song_poem_params)
      redirect_to backend_song_poems_path
    else
      render :new
    end
  end

  def destroy
    @song_poem = SongPoem.find(params[:id])
    @song_poem.destroy
  end

protected
  def song_poem_params
    params.permit(:title, :dynasty, :author, :prelude, :content, :explanation)
  end
end
