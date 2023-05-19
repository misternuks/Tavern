class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = policy_scope(Booking)
    @user_bookings = current_user.bookings
    @dm_bookings = current_user.dm_profile.present? ? @bookings.select{ |booking| booking.dm_profile_id == current_user.dm_profile.id } : []
    @combined_bookings = @user_bookings + @dm_bookings
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    @dm_profile = DmProfile.find(params[:dm_profile_id])
    authorize @booking
  end

  def create
    @dm_profile = DmProfile.find(params[:dm_profile_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dm_profile_id = @dm_profile.id
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:game_type, :date, :session_hours, :player_number, :details)
  end

end
