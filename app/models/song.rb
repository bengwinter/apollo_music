class Song < ActiveRecord::Base
  has_many :playlist_orders
  has_many :playlists, through: :playlist_orders
  belongs_to :user
  
  validates :url, presence: true

  before_update :capitalize

  def favorites
    song_id = self.id
    return Favorite.where(song_id: song_id)
  end

  def capitalize
    self.title = self.title.split(' ').map {|w| w.capitalize }.join(' ')
    self.artist = self.artist.split(' ').map {|w| w.capitalize }.join(' ')
  end
  
end