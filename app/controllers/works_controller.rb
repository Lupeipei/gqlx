class WorksController < ApplicationController
  def index
    @works = Work.all
    if params[:type]
      @works = @works.where(type: params[:type])
    end
  end

  def show
    @work = Work.find(params[:id])
    @suggestion = @work.suggestions.new
    if current_user
      @suggestion.email = current_user.email
    end
  end

  def dongp
    @works = SongPoem.where(author: "苏轼")
    @cis = @works.where(category: 'ci')
    @poetrys = @works.where(category: 'poetry')
    @essays = @works.where(category: 'essay')
  end

  def jiax
    @works = SongPoem.where(author: "辛弃疾")
    @cis = @works.where(category: 'ci')
    @poetrys = @works.where(category: 'poetry')
    @essays = @works.where(category: 'essay')
  end
end
