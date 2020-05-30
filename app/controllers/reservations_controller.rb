class ReservationsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  def index
    @reservations = Reservation.all.order("date ASC").page(params[:page])
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    if  Reservation.where(calendar_id: target_calendar.id).any?
      flash[:danger] = 'すでに予約されています'
      render 'toppages/index'
    else
      @reservation = target_calendar.build_reservation(reservation_params)
      
      if @reservation.save
        @reservation.members.create(name: current_user.name, leader: 1)
        flash[:success] = '予約を確定しました。続いて参加者を登録してください。'
        get_reservation(@reservation)
        session[:double_booking] = '1'
        redirect_to controller: 'members', action: 'new'
      
      else
        flash[:danger] = '予約できませんでした'
        redirect_to controller: 'calendars', action: 'index'
      end
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    unless current_user.id == @reservation.user_id
      redirect_to current_user
    else
      d = Date.today
      today = d.strftime("%Y%m%d").to_i
      if @reservation.date < today
        redirect_to current_user
      end
    end  
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:success] = '予約を変更しました'
      redirect_to @reservation
    else
      flash.now[:danger] = '予約の変更はできませんでした。'
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    flash[:success] = '予約をキャンセルしました。'
    redirect_to controller: 'toppages', action: 'index'
  end
  
  private  

  def reservation_params
    params.require(:reservation).permit(:date,:place,:course,:remarks,:user_id)
  end
  
  def correct_user
    @reservation = current_user.reservations.find_by(id: params[:id])
    unless @reservation
      redirect_to root_url
    end
  end
    
  def get_reservation(reservation)
    session[:reservation_id] = reservation.id
  end  
end