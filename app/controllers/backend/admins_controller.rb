class Backend::AdminsController < Backend::BaseController

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to backend_admins_path
    else
      render :new
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
  end
 
protected
  def admin_params
    params.require(:admin).permit(:email, :name)
  end
end
