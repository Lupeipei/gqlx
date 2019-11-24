class ArticlesController < ApplicationController
  load_and_authorize_resource with_scope: ->(base) { base.includes(:flips) }

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result
  end

  def poetries
    @poetries = @articles.where(category: [ :poetry, :song ]).order('title').page(params[:page])
  end

  def essays
    @essays = @articles.where(category: :essay).order('title').page(params[:page])
  end

  def cis
    @cis = @articles.where(category: :ci).order('title').page(params[:page]).per(24)
  end
end
