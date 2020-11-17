class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @tool = Tool.find(params[:tool_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.tool = Tool.find(params[:tool_id])
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking), notice: "booking was successfully added"
    else
      render :new
    end
  end

  def index
    @user = current_user
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
    @tool_owner = User.find(@booking.user_id)
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :tool_id)
  end
end
