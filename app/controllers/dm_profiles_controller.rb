class DmProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @dm_profiles = policy_scope(DmProfile)
  end

  def show
    @dm_profile = DmProfile.find(params[:id])
    authorize @dm_profile
  end
end
