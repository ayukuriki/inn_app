class BookingsController < ApplicationController
  def index
    @bookings = Booking.where('user_id', "%#{session[:user_id]}%")

  end
  
  def new
    @Booking = Booking.new
  end

  # def create
  #   @Booking = Booking.new(params.require(:Booking).permit(:start_date, :end_date, :people))
  #   if @Booking.save
  #     redirect_to :rooms
  #   else
  #     render"new"
  #   end

  # end

  def confirm
		@booking = Booking.new(@attr)
		if @booking.invalid?
			render :new
		end
  end  

  def back
		@booking = Booking.new(@attr)
		if @booking.invalid?
			render :new
		end
  end  

  def complete
		@booking = Booking.new(@attr)
		if @booking.invalid?
			render :new
		end
  end  


  def show
  end

  def edit
  end

  def update
  end

end
