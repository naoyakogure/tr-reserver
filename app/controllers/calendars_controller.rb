class CalendarsController < ApplicationController
  before_action :require_user_logged_in
  def index
    default_date = 0
    @date = params[:date].to_i || default_date
    @date2 = @date + 30
    default_place = 0
    @place = params[:place] || default_place
    @calendars = Calendar.where(date: @date..@date2, place: @place).page(params[:page])

  end

  def show
    get_calendar
    @reservation = target_calendar.build_reservation
    @date = Calendar.find(params[:id]).date
    @place = Calendar.find(params[:id]).place
  end

  private
  
  def get_calendar
    @calendar = Calendar.find(params[:id])
    session[:calendar_id] = @calendar.id
  end
end
