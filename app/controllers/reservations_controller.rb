class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = Reservation.where(user_id: current_user.id).includes(:user)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to :reservations
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to :reservations
  end

  private

    def reservation_params
      params.require(:reservation).permit(
        :check_in_date, :check_out_date, :total_amount, :number_of_people, :stay_days, :room_id 
      )
    end

end
