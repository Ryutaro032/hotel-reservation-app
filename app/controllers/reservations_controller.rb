class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = Reservation.all
  end
  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
