class JamBase


	def self.upcoming_events(no_of_days, zip)
		start_time = Time.now.strftime("%FT%H:%M:%S") 
		end_time = (Time.now + no_of_days.days).strftime("%FT%H:%M:%S") 
  	# location search:
		uri = URI("http://api.jambase.com/events?zipCode=#{zip}&radius=5&startDate=#{start_time}&endDate=#{end_time}&page=0&api_key=pedaafhf7xkuaegea2nmrmjs")
		
		# commented out to save requests
		#response = JSON.parse(Net::HTTP.get(uri))
		# @events = response["Events"]
		
		# use this for fake data
		@events = self.fake_events["Events"]

		@events.map do |event|
			@venue = Venue.find_by(jambase_id: event["Venue"]["Id"])
			unless @venue
				@venue = Venue.create(
						jambase_id: event["Venue"]["Id"],
						name: event["Venue"]["Name"],
						address: event["Venue"]["Address"],
						city: event["Venue"]["City"],
						state: event["Venue"]["State"],
						country: event["Venue"]["Country"],
						zipcode: event["Venue"]["ZipCode"],
						url: event["Venue"]["Url"],
						latitude: event["Venue"]["Latitude"],
						longitude: event["Venue"]["Longitude"]
					)
			end
			result = {venue: @venue}
			
			artists = event["Artists"].map do |artist|
				@artist = Artist.find_by(jambase_id: artist["Id"])
				unless @artist
					@artist = Artist.create(name: artist["Name"], jambase_id: artist["Id"])
					@artist.get_songs
				end
				@artist
			end
			result.merge(artists: artists)
		end
	end

	# JamBase.fake_events
	def self.fake_events
		{"Info"=>{"TotalResults"=>19, "PageNumber"=>0, "Message"=>nil}, "Events"=>[{"Id"=>2560775, "Date"=>"2015-06-23T19:00:00", "Venue"=>{"Id"=>93653, "Name"=>"Brooklyn Bowl", "Address"=>"61 Wythe Avenue", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11211", "Url"=>"http://www.brooklynbowl.com", "Latitude"=>40.721876, "Longitude"=>-73.957676}, "Artists"=>[{"Id"=>2471, "Name"=>"DJ Logic"}, {"Id"=>24371, "Name"=>"Marco Benevento "}, {"Id"=>30949, "Name"=>"Dave Dreiwitz"}, {"Id"=>64110, "Name"=>"Mike + Ruthy"}, {"Id"=>95192, "Name"=>"Amy Helm"}], "TicketUrl"=>"http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/848305/tfly?utm_medium=api"}, {"Id"=>2574152, "Date"=>"2015-06-23T20:00:00", "Venue"=>{"Id"=>146821, "Name"=>"Palisades ", "Address"=>"906 Broadway", "City"=>"New York", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11206", "Url"=>"", "Latitude"=>0.0, "Longitude"=>0.0}, "Artists"=>[{"Id"=>98409, "Name"=>"Breakfast in Fur"}], "TicketUrl"=>"http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/865667/tfly?utm_medium=api"}, {"Id"=>2561780, "Date"=>"2015-06-23T20:00:00", "Venue"=>{"Id"=>111705, "Name"=>"Acheron", "Address"=>"57 Waterbury St", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11206", "Url"=>"", "Latitude"=>40.7092746, "Longitude"=>-73.9370981}, "Artists"=>[{"Id"=>51392, "Name"=>"Shellshag"}, {"Id"=>83163, "Name"=>"Toys That Kill"}], "TicketUrl"=>"http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/861173/tfly?utm_medium=api"}, {"Id"=>2566021, "Date"=>"2015-06-23T20:00:00", "Venue"=>{"Id"=>98523, "Name"=>"Knitting Factory", "Address"=>"361 Metropolitan Ave", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11211", "Url"=>"http://bk.knittingfactory.com", "Latitude"=>40.7142, "Longitude"=>-73.9557}, "Artists"=>[{"Id"=>83822, "Name"=>"Caroline Rose"}], "TicketUrl"=>"http://www.ticketweb.com/t3/sale/SaleEventDetail?dispatch=loadSelectionData&eventId=5944805&pl=kfny"}, {"Id"=>2545001, "Date"=>"2015-06-23T20:00:00", "Venue"=>{"Id"=>143238, "Name"=>"Rough Trade NYC", "Address"=>"N 9th", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11211", "Url"=>"", "Latitude"=>0.0, "Longitude"=>0.0}, "Artists"=>[{"Id"=>80556, "Name"=>"Miami Horror"}], "TicketUrl"=>"http://www.awin1.com/awclick.php?awinmid=4103&awinaffid=139685&platform=tm&p=http%3a%2f%2fwww.ticketmaster.com%2fevent%2f00004E87C1B23807"}, {"Id"=>2591727, "Date"=>"2015-06-23T20:00:00", "Venue"=>{"Id"=>153597, "Name"=>"C'mon Everybody ", "Address"=>"325 Franklin Avenue", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11238", "Url"=>"", "Latitude"=>0.0, "Longitude"=>0.0}, "Artists"=>[{"Id"=>93515, "Name"=>"The Treatment"}], "TicketUrl"=>"http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/886343/tfly?utm_medium=api"}, {"Id"=>2578811, "Date"=>"2015-06-23T22:00:00", "Venue"=>{"Id"=>57978, "Name"=>"Union Hall", "Address"=>"702 Union Street", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11215", "Url"=>"http://unionhallny.com/", "Latitude"=>40.675234, "Longitude"=>-73.971043}, "Artists"=>[{"Id"=>101286, "Name"=>"In The Whale"}], "TicketUrl"=>"http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/870409/tfly?utm_medium=api"}, {"Id"=>2586092, "Date"=>"2015-06-24T00:00:00", "Venue"=>{"Id"=>98523, "Name"=>"Knitting Factory", "Address"=>"361 Metropolitan Ave", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11211", "Url"=>"http://bk.knittingfactory.com", "Latitude"=>40.7142, "Longitude"=>-73.9557}, "Artists"=>[{"Id"=>107883, "Name"=>"Mail the Horse"}], "TicketUrl"=>"http://www.ticketweb.com/t3/sale/SaleEventDetail?dispatch=loadSelectionData&eventId=5953285&pl=kfny"}, {"Id"=>2574945, "Date"=>"2015-06-24T17:00:00", "Venue"=>{"Id"=>136229, "Name"=>"Output ", "Address"=>"74 Wythe Avenue", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11201", "Url"=>"http://outputclub.com/", "Latitude"=>40.7223328, "Longitude"=>-73.9577161}, "Artists"=>[{"Id"=>54822, "Name"=>"Brodinski"}, {"Id"=>79141, "Name"=>"DJ Spider"}], "TicketUrl"=>"http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/866625/tfly?utm_medium=api"}, {"Id"=>2513394, "Date"=>"2015-06-24T19:30:00", "Venue"=>{"Id"=>112241, "Name"=>"The Rock Shop", "Address"=>"249 4th Avenue", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11215", "Url"=>"http://therockshopny.com/", "Latitude"=>40.6763118, "Longitude"=>-73.9835153}, "Artists"=>[{"Id"=>106980, "Name"=>"My Brother's Keeper"}], "TicketUrl"=>"http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/801085/tfly?utm_medium=api"}, {"Id"=>2580690, "Date"=>"2015-06-24T20:00:00", "Venue"=>{"Id"=>57978, "Name"=>"Union Hall", "Address"=>"702 Union Street", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11215", "Url"=>"http://unionhallny.com/", "Latitude"=>40.675234, "Longitude"=>-73.971043}, "Artists"=>[{"Id"=>77651, "Name"=>"Brian Kennedy"}], "TicketUrl"=>"http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/869767/tfly?utm_medium=api"}, {"Id"=>2592460, "Date"=>"2015-06-24T20:00:00", "Venue"=>{"Id"=>143238, "Name"=>"Rough Trade NYC", "Address"=>"N 9th", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11211", "Url"=>"", "Latitude"=>0.0, "Longitude"=>0.0}, "Artists"=>[{"Id"=>70305, "Name"=>"Mike Posner"}], "TicketUrl"=>"http://www.awin1.com/awclick.php?awinmid=4103&awinaffid=139685&platform=tm&p=http%3a%2f%2fwww.ticketmaster.com%2fevent%2f00004ED284C319A1"}, {"Id"=>2573567, "Date"=>"2015-06-24T20:00:00", "Venue"=>{"Id"=>129552, "Name"=>"The Paper Box", "Address"=>"17 Meadow St", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11206", "Url"=>"http://paperboxnyc.com/", "Latitude"=>40.7106873, "Longitude"=>-73.936488}, "Artists"=>[{"Id"=>63332, "Name"=>"Watusi"}, {"Id"=>109425, "Name"=>"Bocafloja"}], "TicketUrl"=>""}, {"Id"=>2518238, "Date"=>"2015-06-24T20:00:00", "Venue"=>{"Id"=>13422, "Name"=>"Music Hall Of Williamsburg", "Address"=>"66 North 6th Street", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11211", "Url"=>"http://www.musichallofwilliamsburg.com/", "Latitude"=>40.719128, "Longitude"=>-73.961285}, "Artists"=>[{"Id"=>108941, "Name"=>"Leon Bridges"}], "TicketUrl"=>"http://www.ticketmaster.com/leon-bridges-brooklyn-new-york-06-24-2015/event/00004E66B8CE4BD0"}, {"Id"=>2571679, "Date"=>"2015-06-24T20:30:00", "Venue"=>{"Id"=>93653, "Name"=>"Brooklyn Bowl", "Address"=>"61 Wythe Avenue", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11211", "Url"=>"http://www.brooklynbowl.com", "Latitude"=>40.721876, "Longitude"=>-73.957676}, "Artists"=>[{"Id"=>37148, "Name"=>"Pete Rock"}], "TicketUrl"=>"http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/862897/tfly?utm_medium=api"}, {"Id"=>2571666, "Date"=>"2015-06-24T21:00:00", "Venue"=>{"Id"=>55646, "Name"=>"Union Pool", "Address"=>"484 Union Ave", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11211", "Url"=>"  http://www.myspace.com/unionpool  ", "Latitude"=>40.714871, "Longitude"=>-73.951757}, "Artists"=>[{"Id"=>52882, "Name"=>"Mark Sultan "}, {"Id"=>108562, "Name"=>"The Mystery Lights"}], "TicketUrl"=>"http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/862957/tfly?utm_medium=api"}, {"Id"=>2541118, "Date"=>"2015-06-25T00:00:00", "Venue"=>{"Id"=>7780, "Name"=>"Pete's Candy Store", "Address"=>"70 Lorimer St", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11201", "Url"=>"http://www.petescandystore.com/home2.html", "Latitude"=>40.7017, "Longitude"=>-73.9516}, "Artists"=>[{"Id"=>30391, "Name"=>"Margot MacDonald"}], "TicketUrl"=>""}, {"Id"=>2557520, "Date"=>"2015-06-25T00:00:00", "Venue"=>{"Id"=>4507, "Name"=>"Prospect Park Bandshell", "Address"=>"Prospect Park West", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11215", "Url"=>"http://www.prospectpark.org/visit/places/bandshell", "Latitude"=>40.65246, "Longitude"=>-73.97203}, "Artists"=>[{"Id"=>16499, "Name"=>"Lucinda Williams"}], "TicketUrl"=>""}, {"Id"=>2556670, "Date"=>"2015-06-25T00:00:00", "Venue"=>{"Id"=>140219, "Name"=>"Skinny Dennis ", "Address"=>"152 Metropolitan Ave", "City"=>"Brooklyn", "State"=>"New York", "StateCode"=>"NY", "Country"=>"US", "CountryCode"=>"US", "ZipCode"=>"11211", "Url"=>"", "Latitude"=>0.0, "Longitude"=>0.0}, "Artists"=>[{"Id"=>88856, "Name"=>"Margo Valiante"}], "TicketUrl"=>""}]}
	end


end