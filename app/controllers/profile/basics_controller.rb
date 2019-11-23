class Profile::BasicsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @suggests = @user.suggestions
    @flipped_works = @user.flipped_works.includes(:flips)
  end

  def update
    @user = User.find(current_user.id)
    if user_params.values_at(*password_params).any?(&:present?)
      @user.update_with_password(user_params)
    else
      @user.update(user_params)
      flash[:notice] = "更新成功！"
    end

    redirect_to profile_basic_url
  end

protected
  def user_params
    params.fetch(:user).permit(:nickname, :email, *password_params)
  end

  def password_params
    [ :current_password, :password, :password_confirmation ]
  end
end
