class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.order("date ASC")
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      flash[:success] = '正常に作成されました'
      redirect_to  @reservation
    else
      flash.now[:danger] = '作成されませんでした'
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(reservation_params)
      flash[:success] = '予約をしました。'
      redirect_to @reservation
    else
      flash.now[:danger] = '予約できませんでした。'
      render :edit
    end
  end

  def destroy
  end
  
  def reservation_params
    params.require(:reservation).permit(:date,:place,:course,:remarks)
  end
end