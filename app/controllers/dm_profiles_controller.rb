class DmProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[show new create]

  def index
    @dm_profiles = policy_scope(DmProfile)
  end

  def show
    @dm_profile = DmProfile.find(params[:id])
    authorize @dm_profile
  end

  def new
    @dm_profile = DmProfile.new
    authorize @dm_profile
    @user = current_user
  end

  def create
    @user = current_user
    @dm_profile = DmProfile.new(dm_profile_params)
    @dm_profile.user = @user
    authorize @dm_profile
    if @dm_profile.save
      redirect_to dm_profile_path(@dm_profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def dm_profile_params
    params.require(:dm_profile).permit(:price, :experience, :availability, :user_id)
  end
end
