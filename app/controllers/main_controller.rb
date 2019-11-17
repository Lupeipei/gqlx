class MainController < ApplicationController

  def about
  end

  def search
    # @q = Work.ransack(params[:q])
    @works_scope = @q.result(distinct: true)
    @works = @works_scope.page(params[:page])
  end
end
