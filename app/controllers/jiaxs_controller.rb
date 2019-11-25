class JiaxsController < ApplicationController
  before_action -> { @jiaxs = SongPoem.where(author: '辛弃疾') }

  def index
    @q = SongPoem.ransack(params[:q])
    @jiaxs = @q.result
  end

  def poetries
    @poetries = @jiaxs.where(category: [ :poetry, :song ]).order('title').page(params[:page])
  end

  def essays
    @essays = @jiaxs.where(category: :essay).order('title').page(params[:page])
  end

  def cis
    @cis = @jiaxs.where(category: :ci).order('title').page(params[:page]).per(24)
  end

  def show
    @jiax = SongPoem.find(params[:id])
    @suggestion = @jiax.suggestions.new
    if current_user
      @suggestion.email = current_user.email
    end
  end
end
