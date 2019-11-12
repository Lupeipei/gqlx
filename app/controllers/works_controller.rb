class WorksController < ApplicationController

  def index
    @works = Work.all
    if params[:type]
      @works = @works.where(type: params[:type])
    end

    respond_with @works
  end

  def show
    @work = Work.find(params[:id])
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
