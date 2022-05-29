class BookingsController < ApplicationController
  before_action :set_variable, only: %i[confirm complete]

  def index
    @bookings = Booking.all
  end
  
  def confirm
    @booking = Booking.new(bookings_params)
  end  

  def complete
    Booking.create!(bookings_params)
    flash[:alert] = "Booking was successfully created."
    
  end  

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :people, :price, :user_id, :room_id, :room_name, :room_image, :room_intro, :created_at, :updated_at)
  end

  def set_variable
    @name = (bookings_params[:room_name])
    @start_date= (bookings_params[:start_date]).to_date
    @end_date=  (bookings_params[:end_date]).to_date
    @price = (bookings_params[:price]).to_i
    @room_id = params[:room_id]
    @booking_days = (@end_date - @start_date).to_i
    @booking_price = @price * @booking_days
  end

end
