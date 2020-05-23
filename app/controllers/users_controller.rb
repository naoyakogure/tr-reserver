class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :past_reservations]

  #def index
    #@users = User.order(id: :desc).page(params[:page]).per(25)
  #end

  def show
    @user = User.find(params[:id])
    if current_user.id == @user.id
    #@user = current_user
    #@user = User.find(params[:id])
      @reservations = Reservation.where(user: current_user.id).order("date ASC").page(params[:page])
    else
      redirect_to current_user
    end
  end
  
  def past_reservations
    @user = current_user
    @reservations = Reservation.where(user: current_user.id).order("date ASC").page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
