class HomeController < ApplicationController
  def index
    flash.keep

    if user_signed_in?
      redirect_to donations_path
    else
      redirect_to new_user_session_path
    end
  end
end
