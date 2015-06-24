class Artist < ActiveRecord::Base
	has_many :songs

	def get_songs
		puts "inside artist #{self.name}"
		SoundCloud.get_artist_tracks(self)
	end
	
end
