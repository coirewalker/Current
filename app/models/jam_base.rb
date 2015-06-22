class JamBase


	def self.upcoming_events(no_of_days, zip)
		start_time = Time.now.strftime("%FT%H:%M:%S") 
		end_time = (Time.now + no_of_days.days).strftime("%FT%H:%M:%S") 
  	# location search:
		uri = URI("http://api.jambase.com/events?zipCode=#{zip}&radius=2&startDate=#{start_time}&endDate=#{end_time}&page=0&api_key=pedaafhf7xkuaegea2nmrmjs")
		response = JSON.parse(Net::HTTP.get(uri))
		# then gets artist's name:
		@events = response["Events"]
		# puts "response is *****************"
		# puts response
		@events.map do |event|
			result = {venue: event["Venue"]["Name"]}
			artists = event["Artists"].map do |artist|
				# {name: artist["Name"]} 
				{name: artist["Name"], player: SoundCloud.get_artist(artist["Name"])}
			end
			result.merge(artists: artists)
		end
	end


end