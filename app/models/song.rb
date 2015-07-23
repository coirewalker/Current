class Song < ActiveRecord::Base
	belongs_to :artist

  def stream_location
  	SoundCloud.get_song_location(self)
  end

end

