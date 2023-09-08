class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :check, only: %i[ confirm ]
  require 'date'

  def index
    @reservations = Reservation.where(user_id: current_user.id).includes(:user)
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id  = current_user.id
    @reservation.stay_days    = (@reservation.check_out_date - @reservation.check_in_date).to_i
    @reservation.total_amount = (@reservation.stay_days * @reservation.number_of_people * @reservation.room.hotel_fee).to_i

    session[:reservations] = @reservation
  end

  def room_back
    @reservation = Reservation.new(session[:reservations])
    @reservation.user_id = current_user.id
    session.delete(:reservations)
    redirect_to room_path(@reservation.room_id)
  end

  def create
    @reservation = Reservation.new(session[:reservations])
    if @reservation.save
      session.delete(:reservations)
      redirect_to :reservations
      flash[:notice] = "予約が完了しました"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to :reservations
  end

  private

    def reservation_params
      params.require(:reservation).permit(
        :check_in_date, :check_out_date, :number_of_people, :room_id 
      )
    end

    def check
      @reservation = Reservation.new(reservation_params)
      if @reservation.check_in_date == nil || @reservation.check_out_date == nil || @reservation.number_of_people == nil
        redirect_to room_path(@reservation.room_id)
        flash[:alert] = "必須項目を入力してください"
      else
        @total_days = (@reservation.check_out_date - @reservation.check_in_date).to_i
        if @total_days < 0
          redirect_to room_path(@reservation.room_id)
          flash[:alert] = "終了日は開始日以降にしてください"
        elsif @reservation.number_of_people <= 0
          redirect_to room_path(@reservation.room_id)
          flash[:alert] = "人数は１人以上にしてください"
        end
      end
    end

end
