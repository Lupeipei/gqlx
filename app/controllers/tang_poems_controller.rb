class TangPoemsController < ApplicationController
  load_and_authorize_resource with_scope: ->(base) { base.includes(:flips) }

  def index
    @q = TangPoem.ransack(params[:q])
    @tang_poems = @q.result
  end

  def poetries
    @poetries = @tang_poems.where(category: [ :poetry, :song ]).order('title').page(params[:page])
  end

  def essays
    @essays = @tang_poems.where(category: :essay).order('title').page(params[:page])
  end
end
