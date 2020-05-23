class MembersController < ApplicationController
  before_action :require_user_logged_in
  def index
    @reservation = Reservation.find_by(id: params[:format])
    get_reservation(@reservation)
    @members = target_reservation.members
    unless current_user.id == @reservation.user_id
      redirect_to current_user
    end
  end
  
  def new
    if session[:double_booking] == '1'
      session[:double_booking] = nil
      @form = Form::MemberCollection.new
    else 
      session[:double_booking] = nil
      flash[:danger] = 'すでにこの研修の参加者は予約されています'
      render 'toppages/index'
    end
  end 

  def create
    if  Member.where(reservation_id: target_reservation.id).any?
      flash[:danger] = 'すでにこの研修の参加者は予約されています'
      render 'toppages/index'
    else
      @form = Form::MemberCollection.new(member_collection_params)
      if @form.save
        flash[:success] = '参加者を確定しました'
        redirect_to target_reservation
      else
        flash[:danger] = '登録できません入力を確認してください'
        render :new
      end
    end
  end
  
  
  def edit
    @member = Member.find(params[:id])
    @reservation = Reservation.find_by(id: params[:format])
    unless current_user.id == @reservation.user_id
      redirect_to current_user
    end
  end

  def update
    @member  = Member.find(params[:id])
    @check   = Member.new(member_params)
    if @check.name == ""
      flash.now[:danger] = "氏名が空白です"
      render :edit
    else
      if @member.update(member_params)
        flash[:success] = '正常に更新されました'
        redirect_to members_path(target_reservation)
      else
        flash.now[:danger] = '更新されませんでした'
        render :edit
      end
    end
  end

  def destroy
    @member  = Member.find(params[:id])
    
    if @member.leader == 1
      flash.now[:danger] = '代表者は変更のみでキャンセルはできません。'
      render :edit
    else
      @member.update(name: "")
      flash[:success] = '参加者がキャンセルされました'
      redirect_to members_path(target_reservation)
    end
  end
  
  private

  def member_collection_params
    params
      .require(:form_member_collection)
      .permit(members_attributes: Form::Member::REGISTRABLE_ATTRIBUTES)
  end
  
  def member_params
    params.require(:member).permit(:name)
  end
  
  def get_reservation(reservation)
    session[:reservation_id] = reservation.id
  end  
  
end
