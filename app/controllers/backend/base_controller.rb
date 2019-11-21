class Backend::BaseController < ApplicationController
  layout 'backend'
  before_action :authenticate_admin!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do
      format.html { redirect_to root_url, alert: exception.message }
    end
  end
protected
  def current_admin
    current_user
  end

  def authenticate_admin!
    authenticate_user! && current_user&.is_a?(Admin)
  end

  helper_method :current_admin
end
