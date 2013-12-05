class SongsController < ApplicationController
  # before_action :set_song, only: [:show, :edit, :update, :destroy]
  # before_action :fav_song, only: [:add_favorite, :remove_favorite]

  def create
    if current_user
      @playlist = Playlist.find(params["playlist_id"])
    end
    @song = Song.where(url: params["song_url"]).first_or_create
    
    @playlist.songs << @song

    respond_to do |format|
        format.js
    end
  end

  def remote
    
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
      @playlist = Playlist.find(params[:playlist_id])
    end

    def fav_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_song_params
      params.require(:song).permit(:url)
    end
end