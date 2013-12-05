class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :title, default: 'No Title'
      t.text :artist, default: 'No Artist'
      t.text :url
      t.text :source, default: 'SoundCloud'
      t.integer :plays
      t.integer :shares
      t.integer :favorites
      t.text :stream_id
    end
  end
end
