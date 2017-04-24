class SessionsController < ApplicationController
  skip_before_filter :require_login, :only=>[:new, :create]
  def new
    if current_user
      redirect_to "/users/#{current_user.id}"
    else
      render "new.html.erb"
    end
  end
  def create
    user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      flash[:authenticated] = "Welcome, #{ current_user.username }"
      redirect_to "/users/#{ user.id }"
    else
      flash[:notice] = "Unsuccessful login attempt, Wrong Username or Password"
      redirect_to :back
    end
  end
  def destroy
    reset_session
    redirect_to root_path
  end
end
