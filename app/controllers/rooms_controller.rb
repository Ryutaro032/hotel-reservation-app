class RoomsController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def room_params
    params.require(:room).permit(:room_image, :room_name, :introduction, :hotel_fee, :address)
  end
end
