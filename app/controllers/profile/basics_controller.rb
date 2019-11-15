class Profile::BasicsController < ApplicationController
  layout 'backend'

  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin
    @admin.update(admin_params)
    respond_with @admin
  end
protected
  def admin_params
    params.fetch(:admin).permit(:name, :password, :password_confirmation)
  end
end
