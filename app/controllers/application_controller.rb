require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action { @q = Work.includes(:entry).ransack(params[:q]) }
  before_action :adjust_format_for_xhr_html

protected
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      default_url = backend_users_path
    else
      default_url = root_path
    end

    stored_location_for(resource) || default_url
  end

  def human(model, attribute = nil)
    attribute ? model.human_attribute_name(attribute) : model.model_name.human
  end
  alias h human
  helper_method :human, :h

  def store_location
    session[:return_to] = request.get? ? request.url : request.referer
  end

  def back_url(default = root_url)
    session.delete(:return_to) || request.referer || default
  end

  helper_method :back_url

  def adjust_format_for_xhr_html
    return if request.fullpath == '/users/sign_in'

    request.format = :xhrml if request.format.to_sym == :html && (request.xhr? || params[:xhr])
  end
end
