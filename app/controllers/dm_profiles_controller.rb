class DmProfilesController < ApplicationController

  def index
    @dm_profiles = DmProfile.all
  end

  def show
    @dm_profile = DmProfile.find(params[:id])
  end
end
