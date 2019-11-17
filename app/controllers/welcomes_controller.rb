class WelcomesController < ApplicationController

  def index
    @slogans = Plant.order("RANDOM()").limit(3)
    @qin_poetrys = QinPoetry.all.limit(12)
    @han_poetrys = HanPoetry.all.limit(12)
    @tang_poems = TangPoem.all.limit(12)
    @song_poems = SongPoem.all.limit(12)
    @articles = Article.all.limit(12)
  end
end
