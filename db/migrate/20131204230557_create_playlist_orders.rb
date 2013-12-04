class CreatePlaylistOrders < ActiveRecord::Migration
  def change
    create_table :playlist_orders do |t|
      t.integer :order_num
      t.timestamps
      t.belongs_to :song, index:true
      t.belongs_to :playlist, index:true
    end
  end
end
