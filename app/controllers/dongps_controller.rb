class DongpsController < ApplicationController
  before_action -> { @dongps = SongPoem.where(author: '苏轼') }

  def index
    @q = SongPoem.ransack(params[:q])
    @dongps = @q.result
  end

  def poetries
    @poetries = @dongps.where(category: [ :poetry, :song ]).order('title').page(params[:page])
  end

  def essays
    @essays = @dongps.where(category: :essay).order('title').page(params[:page])
  end

  def cis
    @cis = @dongps.where(category: :ci).order('title').page(params[:page]).per(24)
  end

  def show
    @dongp = SongPoem.find(params[:id])
    @suggestion = @dongp.suggestions.new
    if current_user
      @suggestion.email = current_user.email
    end
  end
end
