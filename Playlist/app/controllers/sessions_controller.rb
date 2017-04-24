class SessionsController < ApplicationController
  skip_before_filter :require_login, :only=>[:new, :create]
  def new
    if current_user
      redirect_to songs_path
    else
      render "new.html.erb"
    end
  end
  def create
    user = User.find_by_email_address(params[:email_address]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      flash[:authenticated] = "Hello, #{ current_user.first_name } #{ current_user.last_name }!"
      redirect_to "/songs"
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
