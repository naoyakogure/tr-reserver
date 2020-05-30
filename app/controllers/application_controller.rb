class ApplicationController < ActionController::Base

  include SessionsHelper
  include CalendarsHelper
  include ReservationsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def member_collection_params
    params
      .require(:form_member_collection)
      .permit(members_attributes: Form::Member::REGISTRABLE_ATTRIBUTES)
  end
end