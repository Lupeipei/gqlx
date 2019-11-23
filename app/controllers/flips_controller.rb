class FlipsController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource :work
  before_action -> { @user = current_user }

  def new
  end

  def create
    flash.keep(:alert)
    @flip = @work.flips.new
    @flip.user = @user
    @flip.save
    respond_with @flip
  end

  def show
  end

  def destroy
    @flip = @work.flips.where(user_id: @user).take
    @flip.destroy
    respond_with @flip
  end
end
