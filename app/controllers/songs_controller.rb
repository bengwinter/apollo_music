class SongsController < ApplicationController
  # before_action :set_song, only: [:show, :edit, :update, :destroy]
  # before_action :fav_song, only: [:add_favorite, :remove_favorite]

  def create
    if current_user
      @playlist = Playlist.find(params["playlist_id"])
      client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
      track = client.get('/resolve', :url => params["song_url"])
      @song = Song.where(url: params["song_url"]).first_or_create(title: params["song_title"], album: params["song_album"], artist: params["song_artist"], duration: track["duration"], stream_id: track["id"])
      @playlist.songs << @song
    end
    respond_to do |format|
        format.js
    end
  end

  def remove
    @order_id = params["order_id"]
    PlaylistOrder.find(@order_id).destroy
    respond_to do |format|
      format.js
    end
  end

  def favorite
    favorites_array = current_user.favorites 
    favorites_array << PlaylistOrder.find(params[:order_id]).song_id.to_s
    favorites_array.uniq
    current_user.update(favorites: favorites_array)
    binding.pry
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_song
    #   @song = Song.find(params[:id])
    #   @playlist = Playlist.find(params[:playlist_id])
    # end

    # def fav_song
    #   @song = Song.find(params[:id])
    # end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def add_song_params
    #   params.require(:song).permit(:url)
    # end
end