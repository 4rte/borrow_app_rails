class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: "booking was successfully added"
    else
      render :new
    end
  end

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
