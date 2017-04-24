class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  before_filter :require_login
  private
  def require_login
    unless current_user
      redirect_to root_path, notice: "Please log back in"
    end
  end
  helper_method :current_user
end
