class WelcomesController < ApplicationController

  def index
    @slogans = Plant.order("RANDOM()").limit(3)
    @qin_poetrys = QinPoetry.without_essays.limit(12)
    @han_poetrys = HanPoetry.without_essays.limit(12)
    @tang_poems = TangPoem.without_essays.limit(12)
    @song_poems = SongPoem.without_essays.limit(12)
    @articles = Article.without_essays.limit(12)
  end
end
