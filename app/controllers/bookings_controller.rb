class BookingsController < ApplicationController
  def index
    @bookings = Booking.all

  end
  


  def confirm
    @booking = Booking.new(bookings_params)
    @start_date= (bookings_params[:start_date]).to_date
    @end_date=  (bookings_params[:end_date]).to_date
    @price = (bookings_params[:price]).to_i
    @room_id = params[:room_id]
    @booking_days = (@end_date - @start_date).to_i
    @booking_price = @price * @booking_days

		if @booking.invalid?
			render :new
		end
  end  


  def complete
    @name = (bookings_params[:room_name])
    @start_date= (bookings_params[:start_date]).to_date
    @end_date=  (bookings_params[:end_date]).to_date
    @price = (bookings_params[:price]).to_i
    @room_id = params[:room_id]
    @booking_days = (@end_date - @start_date).to_i
    @booking_price = @price * @booking_days



    Booking.create!(bookings_params)
    flash[:alert] = "Booking was successfully created."
    
  end  


  def show
  end

  def edit
  end

  def update
  end

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :people, :price, :user_id, :room_id, :room_name, :room_image, :room_intro, :created_at, :updated_at)
  end

end
