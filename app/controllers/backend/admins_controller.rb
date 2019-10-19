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
      respond_with @admin, location: [ :backend, Admin ]
    else
      render :new
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    respond_with @admin, location: [ :backend, Admin ]
  end
 
protected
  def admin_params
    params.require(:admin).permit(:email, :name)
  end
end
