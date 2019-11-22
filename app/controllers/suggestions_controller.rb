class SuggestionsController < ApplicationController
  load_and_authorize_resource :work
  load_and_authorize_resource through: :work

  def create
    @suggestion.user_id = current_user.id if current_user

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
