class MainController < ApplicationController
  def about
  end

  def search
    @works = @q.result(distinct: true)
    @works = @works.order('category').page(params[:page])
  end
end
