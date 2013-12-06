class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :title, default: 'Untitled'
      t.text :artist, default: 'Untitled'
      t.text :url
      t.text :source, default: 'SoundCloud'
      t.text :album, default: 'Untitled'
      t.text :genre
      t.integer :play_count
      t.integer :share_count
      t.integer :favorite_count
      t.string :remote_creator_id
      t.string :duration
      t.text :stream_id
      t.text :source_creator_id
      t.text :source_creator_username
      t.text :source_artwork
      t.text :source_play_count
      t.text :source_download_count
      t.text :source_favorites_count
      t.text :source_upload_date
      t.text :source_genre
      t.text :source_title
      t.belongs_to :user
      t.timestamps
    end
  end
end
