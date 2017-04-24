class UsersController < ApplicationController
  skip_before_filter :require_login, :only=>[:create, :show]
  def create
    user = User.new(user_create_params)
    if user.save
      session[:user_id] = user.id
      flash[:authenticated] = "Hello, #{ current_user.first_name} #{ current_user.last_name}!"
      redirect_to songs_path, notice: "You have been successfully registered"
    else
      flash[:notice] = "Unsuccessful, find errors below"
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end
  def show
    if current_user
      @user = User.find(params[:id])
      @plist = Plist.where(user:@user).group_by(&:song)
    else
      redirect_to root_path, notice: "Please log back in"
    end
  end
  private
  def user_create_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
  end
end
