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
  end

  def jiax
  end
end
