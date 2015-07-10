class SoundCloud

	CLIENT = Soundcloud.new(:client_id => 'ddac1035019e721df71b51a0e6d38a7f',
                        :client_secret => '2bc60eb40dc4943293c3d1486fe0989a',
                        :redirect_uri => 'http://example.com/callback')

	def self.get_artist_tracks(artist, track_count=1)
		puts "Artist is #{artist}"
		query = URI.encode(artist.name)
		uri = URI.parse("http://api.soundcloud.com/tracks.json?q=#{query}&limit=#{track_count}")
		response = JSON.parse(Net::HTTP.get(uri))
		tracks = response.map do |track|
			song = Song.find_by(soundcloud_id: track["id"])
			unless song
				song = Song.create(
					soundcloud_id: track["id"],
					artist_id: artist.id,
					song_name: track["title"],
					stream_url: track["stream_url"]
					#venue_name: ??
					# add column t.string "venue_name" in songs DB
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