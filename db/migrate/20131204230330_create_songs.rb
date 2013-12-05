class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :title, default: 'Untitled'
      t.text :artist, default: 'Untitled'
      t.text :url
      t.text :source, default: 'SoundCloud'
      t.text :album, default: 'Untitled'
      t.integer :plays
      t.integer :shares
      t.integer :favorites
      t.string :remote_creator_id
      t.string :duration
      t.text :stream_id
    end
  end
end
