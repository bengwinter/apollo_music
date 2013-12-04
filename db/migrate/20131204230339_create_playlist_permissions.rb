class CreatePlaylistPermissions < ActiveRecord::Migration
  def change
    create_table :playlist_permissions do |t|
      t.text :level
      t.timestamps
      t.belongs_to :user, index:true
      t.belongs_to :playlist, index:true
    end
  end
end
