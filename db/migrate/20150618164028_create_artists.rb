class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.string :song_name
      t.string :album_name
      t.string :venue_name
      t.string :venue_location
      t.string :venue_address
      t.string :event_datetime
      t.timestamps null: false
    end
  end
end
