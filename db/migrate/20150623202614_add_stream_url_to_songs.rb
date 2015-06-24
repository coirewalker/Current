class AddStreamUrlToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :stream_url, :string
  end
end
