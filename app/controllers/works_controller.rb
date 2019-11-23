class WorksController < ApplicationController
  load_and_authorize_resource with_scope: ->(base) { base.includes(:flips) }

  def index
    if params[:type]
      @works = @works.where(type: params[:type])
    end
  end

  def show
    @suggestion = @work.suggestions.new
    if current_user
      @suggestion.email = current_user.email
    end
  end

  def dongp
    @works = @works.where(type: 'SongPoem', author: "苏轼")
    @cis = @works.where(category: 'ci')
    @poetrys = @works.where(category: 'poetry')
    @essays = @works.where(category: 'essay')
  end

  def jiax
    @works = @works.where(type: 'SongPoem', author: "辛弃疾")
    @cis = @works.where(category: 'ci')
    @poetrys = @works.where(category: 'poetry')
    @essays = @works.where(category: 'essay')
  end
end
