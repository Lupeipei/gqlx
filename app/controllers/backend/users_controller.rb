class Backend::UsersController < Backend::BaseController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    @user.type = 'Admin'
    if @user.save
      respond_with @user, location: [ :backend, User ]
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    respond_with @user, location: [ :backend, User ]
  end

protected
  def user_params
    params.require(:user).permit(:email, :nickname)
  end
end
