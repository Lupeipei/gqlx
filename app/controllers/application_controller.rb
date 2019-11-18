require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action { @q = Work.includes(:entry).ransack(params[:q]) }
protected
  def human(model, attribute = nil)
    attribute ? model.human_attribute_name(attribute) : model.model_name.human
  end
  alias h human
  helper_method :human, :h
end
