class DongpsController < ApplicationController
  before_action -> { @dongpos = SongPoem.where(author: '苏轼') }

  def index
    @q = SongPoem.ransack(params[:q])
    @dongpos = @q.result
  end

  def poetries
    @poetries = @dongpos.where(category: [ :poetry, :song ]).order('title').page(params[:page])
  end

  def essays
    @essays = @dongpos.where(category: :essay).order('title').page(params[:page])
  end

  def cis
    @cis = @dongpos.where(category: :ci).order('title').page(params[:page]).per(24)
  end
end
