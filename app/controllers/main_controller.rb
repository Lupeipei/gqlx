class MainController < ApplicationController

  def about
  end

  def search
    @works_scope = @q.result(distinct: true)
    @works = @works_scope.page(params[:page])
  end
end
