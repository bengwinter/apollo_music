class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name, default: 'Untitled Playlist'
      t.timestamps
    end
  end
end
