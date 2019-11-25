class SongPoemsController < ApplicationController
  load_and_authorize_resource with_scope: ->(base) { base.includes(:flips) }

  def index
    @q = SongPoem.ransack(params[:q])
    @song_poems = @q.result
  end

  def poetries
    @poetries = @song_poems.where(category: [ :poetry, :song ]).order('title').page(params[:page])
  end

  def essays
    @essays = @song_poems.where(category: :essay).order('title').page(params[:page])
  end

  def cis
    @cis = @song_poems.where(category: :ci).order('title').page(params[:page]).per(24)
  end

  def show
    @suggestion = @song_poem.suggestions.new
    if current_user
      @suggestion.email = current_user.email
    end
  end
end
