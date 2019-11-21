class Backend::UsersController < Backend::BaseController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      respond_with @user, location: [ :backend, User ]
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_with @user, location: [ :backend, User ]
  end

protected
  def user_params
    params.require(:user).permit(:email, :nickname)
  end
end
