class HanPoetriesController < ApplicationController
  load_and_authorize_resource with_scope: ->(base) { base.includes(:flips) }

  def index
    @q = HanPoetry.ransack(params[:q])
    @han_poetries = @q.result
  end

  def poetries
    @poetries = @han_poetries.where(category: [ :poetry, :song ]).order('title').page(params[:page])
  end

  def essays
    @essays = @han_poetries.where(category: :essay).order('title').page(params[:page])
  end

  def yuefus
    @yuefus = @han_poetries.where(category: :yuefu).order('title').page(params[:page])
  end

  def show
    @suggestion = @han_poetry.suggestions.new
    if current_user
      @suggestion.email = current_user.email
    end
  end
end
