class PlistsController < ApplicationController
  def create
    song = Song.find(params[:format])
    plist = Plist.new(song:song, user:current_user)
    if plist.save
      song.count += 1
      song.save
    end
    redirect_to :back
  end
end
