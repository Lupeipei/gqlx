class WorksController < ApplicationController

  def index
    @tang_poems = TangPoem.all.limit(12)
    @song_poems = SongPoem.all.limit(12)
    @articles = Article.all.limit(12)
  end

  def show
    @work = Work.find(params[:id])
  end
end
