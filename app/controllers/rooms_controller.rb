class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.where(user_id: current_user.id).includes(:user)
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
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.user_id = current_user.id
    if @room.update(room_params)
      redirect_to :rooms
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to :rooms
  end

  def room_params
    params.require(:room).permit(:room_image, :room_name, :introduction, :hotel_fee, :address)
  end
end
