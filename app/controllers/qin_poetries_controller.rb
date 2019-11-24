class QinPoetriesController < ApplicationController
  load_and_authorize_resource with_scope: ->(base) { base.includes(:flips) }

  def index
    @q = QinPoetry.ransack(params[:q])
    @qin_poetries = @q.result
  end

  def essays
    @essays = @qin_poetries.where(category: :essay).order('title').page(params[:page])
  end

  def poetries
    @poetries = @qin_poetries.where(category: [ :poetry, :song ]).order('title').page(params[:page]).per(24)
  end
end
