class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @dm_profile = DmProfile.find(params[:dm_profile_id])
  end

  def create
    @dm_profile = DmProfile.find(params[:dm_profile_id])
    @booking = Booking.new(booking_params)
    @booking.dm_profile_id = @dm_profile.id
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:game_type, :date, :session_hours, :player_number, :details)
  end

end
