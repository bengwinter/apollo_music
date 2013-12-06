class SongsController < ApplicationController
  # before_action :set_song, only: [:show, :edit, :update, :destroy]
  # before_action :fav_song, only: [:add_favorite, :remove_favorite]

  def create
    if current_user
      if params["playlist_id"] == ""
        @playlist = current_user.playlists.find_by_name("All")
      else
        @playlist = Playlist.find(params["playlist_id"])
      end
      if Song.where(url: params["song_url"]) == nil
        client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
        track = client.get('/resolve', :url => params["song_url"])
        @song = Song.where(url: params["song_url"], user_id: current_user.id).first_or_create(title: params["song_title"], album: params["song_album"], artist: params["song_artist"], duration: track["duration"], stream_id: track["id"], genre: params["song_genre"], source_creator_id: track["user_id"], source_creator_username: track["user"]["username"], source_artwork: track["artwork_url"], source_play_count: track["playback_count"], source_download_count: track["download_count"], source_favorites_count: track["favoritings_count"], source_upload_date: track["created_at"], source_genre: track["genre"], source_title: track["title"])
        @playlist.songs << @song
      else
        @song = Song.where(url: params["song_url"]).first.dup.update(user_id: current_user.id)
        @playlist.songs << @song
      end
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
    @song_id = PlaylistOrder.find(params["order_id"]).song_id
    Favorite.where(user_id: current_user.id, song_id: @song_id).first_or_create
    redirect_to root_url
  end

  def unfavorite
    @song_id = PlaylistOrder.find(params["order_id"]).song_id
    Favorite.where(user_id: current_user.id, song_id: @song_id).destroy_all
    redirect_to root_url
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