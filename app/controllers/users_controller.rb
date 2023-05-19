class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    authorize @user
    @dm_profile = DmProfile.new
    authorize @dm_profile
  end



end
