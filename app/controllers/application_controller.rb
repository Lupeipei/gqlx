class ApplicationController < ActionController::Base

protected
  def human(model, attribute = nil)
    attribute ? model.human_attribute_name(attribute) : model.model_name.human
  end
  alias h human
  helper_method :human, :h
end
