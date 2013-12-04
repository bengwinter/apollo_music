class Playlist < ActiveRecord::Base
  has_many :playlist_permissions
  has_many :playlists, through: :playlist_permissions
  has_many :playlist_orders
  has_many :songs, through: :playlist_orders

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id

end