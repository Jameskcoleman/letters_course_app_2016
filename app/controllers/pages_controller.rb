class PagesController < ApplicationController
  def front
    redirect_to home_path if current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

end