class Backend::BaseController < ApplicationController
  layout 'backend'
  before_action :authenticate_user!
protected
  def current_admin
    current_user
  end

  helper_method :current_admin
end
