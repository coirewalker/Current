class SoundCloud

	def self.get_artist_tracks(artist, track_count=3)
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
					)
			end
			song
		end
		tracks
		#id = response[0]["id"]
	end

	# def something
	# 		@songs.map do |song|
	# 		@song = Song.find_by(params: soundcloud_id)
	# 			unless @song
	# 				@song = Song.create(
	# 					ERROR: flying too close to the sun....
	# 					)
	# 	end
	# end

end