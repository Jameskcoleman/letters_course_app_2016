class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def require_user
    redirect_to sign_in_path unless current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_admin
    access_denied unless logged_in? and current_user.admin?
  end

  def access_denied
    flash[:error] = "You can't do that."
    redirect_to root_path
  end

end
