module CalendarsHelper
  def target_calendar
    @target_calendar ||= Calendar.find_by(id: session[:calendar_id])
  end
end
