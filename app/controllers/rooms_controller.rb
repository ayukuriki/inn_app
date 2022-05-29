class RoomsController < ApplicationController

  def index
    @numbers =Room.where('address LIKE ?', "%#{params[:area]}%").count
    @rooms= Room.where('address LIKE ?', "%#{params[:area]}%")
    # .where('name LIKE ?' or 'introduction LIKE ?'or 'address LIKE ?', "%#{params[:keyword]}%")
  end

  def new
    @room = Room.new
  end

  def show
     @room = Room.find(params[:id])
     @booking = Booking.new

  end

  def create
    @room = Room.new(rooms_params)
    @room.user_id = current_user.id
    if @room.save!
      redirect_to @room
      numbers =Room.count
      flash[:alert] = "Room was successfully created."

    else
      flash.now[:alert]="registration is failled."
      render"new"
    end

  end

  def posts
    @rooms = Room.where(user_id: current_user.id)
  end

end


def rooms_params
  params.require(:room).permit(:name, :introduction, :price, :address, :image)
end
