class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.timestamps null: false
    end

    create_table :songs do |t|
      t.string :song_name
      t.string :album_name
      t.references :artist
      t.string :soundcloud_id
      t.timestamps null: false
    end

    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.float  :latitude
      t.float  :longitude
      t.integer :jambase_id
      t.string :url
      t.timestamps null: false
    end
  end
end
