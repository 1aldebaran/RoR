class SecretsController < ApplicationController
  def index
    @secrets = Secret.all.includes(:likes)
  end
  def create
    secret = Secret.new(content:params[:content], user:current_user)
    if secret.save
      flash[:notice] = "You have successfully added a secret"
    else
      flash[:notice] = "Secret field blank"
    end
    redirect_to :back
  end

  def destroy
    delete_associated_likes
    Secret.find(params[:id]).delete
    redirect_to :back, notice: "You have successfully deleted a secret"
  end
  private
  def delete_associated_likes
    Like.where(secret_id:params[:id]).each {|like| like.delete}
  end
end
