class SongsController < ApplicationController
  # before_action :set_song, only: [:show, :edit, :update, :destroy]
  # before_action :fav_song, only: [:add_favorite, :remove_favorite]

  def create
    if current_user
      @playlist = Playlist.find(params["playlist_id"])
      client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
      track = client.get('/resolve', :url => "https://soundcloud.com/rostonni/steve-grand-all-american-boy")
      binding.pry
      @song = Song.where(url: params["song_url"]).first_or_create(title: params["song_title"], album: params["song_album"], artist: params["song_artist"])
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