class AddIdsToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :jambase_id, :integer
    add_column :artists, :soundcloud_id, :integer
  end
end
