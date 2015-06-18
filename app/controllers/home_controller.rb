class HomeController < ApplicationController

	def home

	end

	def show
  	start_time = Time.now.strftime("%FT%H:%M:%S") 
		end_time = (Time.now + 20.days).strftime("%FT%H:%M:%S") 

  	users_zip = params[:users_zip]
  	# jambase search params
		uri = URI("http://api.jambase.com/events?zipCode=#{users_zip}&radius=10&startDate=#{start_time}&endDate=#{end_time}&page=0&api_key=pedaafhf7xkuaegea2nmrmjs")
		response = JSON.parse(Net::HTTP.get(uri))
		@events = response["Events"]
		@playlist = @events.map do |event|
			result = {venue: event["Venue"]["Name"]}
			artists = event["Artists"].map do |artist|
				{name: artist["Name"], song: get_echo_artist(artist["Name"])}
			end
			result.merge(artists: artists) 
		end

		#puts "echo nest result:  #{echo_nest(@events)}"
	end


private
	# def jambase_search(results) #retrieves jambase artist name without spaces
	# 	jambase_result = @events[0]["Artists"][0]["Name"]
	# 	jambase_artist = jambase_result(CGI::escape name)	
	# end

	def echo_nest(results) #puts jambase artist name into echo nest api search
		artist = results[0]["Artists"][0]["Name"]
		uri = URI("http://developer.echonest.com/api/v4/playlist/static?api_key=GY2PWSC90XLRX2SNR&artist=#{CGI::escape artist}&format=json&results=20&type=artist")
		response["response"] = JSON.parse(Net::HTTP.get(uri))
	end

	def get_echo_artist(artist) 
	#puts jambase artist name into echo nest api search
		uri = URI("http://developer.echonest.com/api/v4/playlist/static?api_key=GY2PWSC90XLRX2SNR&artist=#{CGI::escape artist}&format=json&results=20&type=artist")
		begin
			response= JSON.parse(Net::HTTP.get(uri))
			response["response"]["songs"][0]["title"]
		rescue
			"There was a problem"
		end
	end

end
