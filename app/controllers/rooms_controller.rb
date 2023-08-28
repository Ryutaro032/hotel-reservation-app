class RoomsController < ApplicationController
  # before_action :authenticate_user!

  def home
    @rooms = Room.where(user_id: current_user.id).includes(:user)
  end

  def search
    if params[:word].present?
      @rooms = Room.search(params[:word])
    elsif params[:area].present?
      @rooms = Room.area_search(params[:area])
    else
      @rooms = Room.all
    end

    if params[:link_name].present?
      @rooms = Room.link_search(params[:link_name])
    end

  end

  def index
    
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to rooms_home_path
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
      redirect_to rooms_home_path
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_home_path
  end

private

  def room_params
    params.require(:room).permit(:room_image, :room_name, :introduction, :hotel_fee, :address)
  end

end
