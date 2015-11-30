class SoundCloud

	CLIENT = Soundcloud.new(:client_id => '6cd1f51e6347887c078767d1780aad07',
                        :client_secret => ENV['SOUNDCLOUD_APIKEY'])

	def self.get_artist_tracks(artist, track_count=1)
		puts "Artist is #{artist}"
		query = URI.encode(artist.name)
		#uri = URI.parse("http://api.soundcloud.com/tracks.json?q=#{query}&limit=#{track_count}")
		#response = JSON.parse(Net::HTTP.get(uri))
		response = CLIENT.get('/tracks', :q => query)
		tracks = response.map do |track|
			song = Song.find_by(soundcloud_id: track["id"])
			unless song
				song = Song.create(
					soundcloud_id: track["id"],
					artist_id: artist.id,
					song_name: track["title"],
					stream_url: track["stream_url"]
					)
			end
			song
		end
		tracks
	end

	def self.get_song_location(song)
		response = CLIENT.get(song.stream_url, :allow_redirects => true)	
	end

end
