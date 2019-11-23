class WelcomesController < ApplicationController
  def index
    # @slogans = Plant.order("RANDOM()").limit(3)
    @works = Work.includes(:flips).without_essays
    @qin_poetrys = @works.where(type: 'QinPoetry').limit(12)
    @han_poetrys = @works.where(type: 'HanPoetry').limit(12)
    @tang_poems = @works.where(type: 'TangPoem').limit(12)
    @song_poems = @works.where(type: 'SongPoem').limit(12)
    @articles = @works.where(type: 'Article').limit(12)
  end
end
