class MainController < ApplicationController

  def about
  end

  def search
    @works = @q.result(distinct: true)
    # @works = @works_scope.page(params[:page])
  end
end
