class SoundCloud

	def self.get_artist(artist) # was called "returned"
		query = URI.encode(artist)
		uri = URI.parse("http://api.soundcloud.com/tracks.json?q=#{query}&limit=1")
		response = JSON.parse(Net::HTTP.get(uri))
		id = response[0]["id"]
		iframe = "<iframe width='100%' height='100' scrolling='no' frameborder='no' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{id}&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true'></iframe>"
	end

end