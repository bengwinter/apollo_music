class PlaylistsController < ApplicationController
  def create
    if current_user
      @playlist = current_user.playlists.create(name: params["name"])
    end
    respond_to do |format|
        format.js
    end
  end

  def single_fetch
    @playlist = Playlist.find(params["playlist_id"])
    respond_to do |format|
      format.js
    end
  end
end