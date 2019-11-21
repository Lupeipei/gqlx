class SuggestionsController < ApplicationController
  def create
    @work = Work.find(params[:work_id])
    @suggestion.user_id = current_user if current_user
    @suggestion = @work.suggestions.new(suggestion_params)

    if @suggestion.save
      flash[:notice] = "提交成功!"
    end

    respond_with @suggestion, location: work_url(@work)
  end

protected
  def suggestion_params
    params.require(:suggestion).permit(:email, :comments)
  end
end
