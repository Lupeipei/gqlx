require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action { @q = Work.includes(:entry).ransack(params[:q]) }

protected
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      default_url = backend_admins_path
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
end
