class Profile::BasicsController < ApplicationController
  layout 'backend'

  def show
    @admin = current_admin
  end

  def update
  end
end
