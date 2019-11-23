class FlipsController < ApplicationController
  # before_action :require_user!
  before_action :authenticate_user!

  load_and_authorize_resource :work
  before_action -> { @user = current_user }

  def create
    @flip = @work.flips.new
    @flip.user = @user
    @flip.save
    respond_with @flip
  end

  def destroy
    @flip = @work.flips.where(user_id: @user).take
    @flip.destroy
    respond_with @flip
  end

# protected
#   def require_user!
#     unless current_user
#       redirect_to new_user_session_url
#     end
#   end
end
