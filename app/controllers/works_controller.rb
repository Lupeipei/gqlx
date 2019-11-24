class WorksController < ApplicationController
  load_and_authorize_resource with_scope: ->(base) { base.includes(:flips) }

  def show
    @suggestion = @work.suggestions.new
    if current_user
      @suggestion.email = current_user.email
    end
  end
end
