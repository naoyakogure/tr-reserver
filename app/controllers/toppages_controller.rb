class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      redirect_to @user
    end
  end
end
