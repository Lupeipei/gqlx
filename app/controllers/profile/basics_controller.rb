class Profile::BasicsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if user_params.values_at(*password_params).any?(&:present?)
      if @user.update_with_password(user_params)
        flash[:notice] = "更新成功！"
        respond_with @user, action: :show, location: -> { [ :profile, :basic ] }
      else
        flash[:alert] = @user.errors.full_messages.join(', ')
        render :show
      end
    else
      @user.update(user_params)
      flash[:notice] = "更新成功！"
      respond_with @user, action: :show, location: -> { [ :profile, :basic ] }
    end
  end

protected
  def user_params
    params.fetch(:user).permit(:nickname, :email, *password_params)
  end

  def password_params
    [ :current_password, :password, :password_confirmation ]
  end
end
