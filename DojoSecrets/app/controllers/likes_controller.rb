class LikesController < ApplicationController
  def create
    secret = Secret.find(params[:format])
    like = Like.new(secret:secret, user:current_user)
    like.save
    redirect_to :back
  end

  def destroy
    Like.find(params[:id]).delete
    redirect_to :back
  end
end
