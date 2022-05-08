class RoomsController < ApplicationController
   numbers =Room.count

  def index
    @room = Room.where('address LIKE ?', "%#{params[:area]}%")
    # .where('name LIKE ?' or 'introduction LIKE ?'or 'address LIKE ?', "%#{params[:keyword]}%")

  end



  def new
    @room = Room.new


  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :image))
    if @room.save
      redirect_to :rooms
      numbers =Room.count
    else
      render"new"
    end

  end

  def show
    @room = Rooms.where(user_id: "session_id")
    

  end

  # private

  # # 検索フォームから受け取ったパラメータ
  # def search_params
  #   params
  #     .require(:search_product)
  #     .permit(Search::Product::ATTRIBUTES)
  # end

end
