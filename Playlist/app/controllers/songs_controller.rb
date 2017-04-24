class SongsController < ApplicationController
  def index
    @songs = Song.order(created_at: :desc).all.includes(:plists)
  end
  def create
    song = Song.new(title:params[:title], artist:params[:artist], count:0)
    if song.save
      flash[:notice] = "You have successfully added a song"
    else
      flash[:errors] = song.errors.full_messages
    end
    redirect_to :back
  end
  def show
    if current_user
      @song = Song.find(params[:id])
      @users = Plist.where(song_id:params[:id]).group_by(&:user)
    else
      redirect_to root_path, notice: "Please log back in"
    end
  end
  private
  def delete_associated_plists
    Plist.where(song_id:params[:id]).each {|plist| plist.delete}
  end
end
