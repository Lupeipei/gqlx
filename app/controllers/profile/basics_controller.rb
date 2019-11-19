class Profile::BasicsController < ApplicationController
  layout 'backend'

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    respond_with @user
  end
protected
  def user_params
    params.fetch(:user).permit(:name, :password, :password_confirmation)
  end
end
