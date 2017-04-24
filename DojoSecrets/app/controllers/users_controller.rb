class UsersController < ApplicationController
  skip_before_filter :require_login, :only=>[:create, :show]
  def create
    user = User.new(user_create_params)
    if user.save
      session[:user_id] = user.id
      flash[:authenticated] = "Welcome, #{ current_user.username}"
      redirect_to secrets_path, notice: "You have been successfully registered"
    else
      flash[:notice] = "Unsuccessful, find errors below"
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end
  def show
    if current_user
      confirm_id
      @secrets = current_user.secrets.includes(:likes)
      @secrets_liked = current_user.secrets_liked.includes(:likes)
    else
      redirect_to root_path, notice: "Please log back in"
    end
  end

  def edit
    confirm_id
  end
  def update
    params[:user].delete_if{|k, v| v.blank?}
    if !params[:user].empty?
      confirm_id
      if current_user.update(user_update_params)
        flash[:notice] = "You have successfully updated a field"
      else
        flash[:notice] = "Unsuccessful"
        flash[:errors] = current_user.errors.full_messages
      end
    end
    redirect_to :back
  end
  def destroy
    confirm_id
    @name = current_user.first_name
    if current_user.destroy
      reset_session
      redirect_to root_path, notice: "Sad to see you go #{@name}"
    else
      redirect_to "/users/#{current_user.id}/edit", notice: "Could not complete"
    end
  end
  private
  def user_create_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :username, :password, :password_confirmation)
  end
  def user_update_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :username) unless params[:user].empty?
  end
  def confirm_id
    if params[:id] == session[:user_id].to_s
      return params[:id]
    else
      redirect_to "/users/#{current_user.id}"
    end
  end
end
