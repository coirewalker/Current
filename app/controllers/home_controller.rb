require 'uri'
require 'net/http'
require 'json'

class HomeController < ApplicationController

	def home
	end

	def show
  	start_time = Time.now.strftime("%FT%H:%M:%S") 
		end_time = (Time.now + 20.days).strftime("%FT%H:%M:%S") 

  	users_zip = params[:users_zip]
  	# location search:
		uri = URI("http://api.jambase.com/events?zipCode=#{users_zip}&radius=10&startDate=#{start_time}&endDate=#{end_time}&page=0&api_key=pedaafhf7xkuaegea2nmrmjs")
		response = JSON.parse(Net::HTTP.get(uri))
		# then gets artist's name:
		@events = response["Events"]

		@playlist_artist = @events.map do |event|
			result = {venue: event["Venue"]["Name"]}
			artists = event["Artists"].map do |artist|
				{name: artist["Name"]} 
				# {name: artist["Name"], song: get_echo_artist(artist["Name"])}
			end
			# result.merge(artists: artists) 
		end

		@player = soundcloud("beck")
	end


private
	
	def soundcloud(artist) # was called "returned"
		query = URI.encode(artist)
		uri = URI.parse("http://api.soundcloud.com/tracks.json?q=#{query}&limit=3")
		response = JSON.parse(Net::HTTP.get(uri))
		id = response[0]["id"]
		iframe = "<iframe width='100%' height='350' scrolling='no' frameborder='no' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{id}&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true'></iframe>"
	end

	# def get_echo_artist(artist) 
	# #puts jambase artist name into echo nest api search
	# 	uri = URI("http://developer.echonest.com/api/v4/playlist/static?api_key=GY2PWSC90XLRX2SNR&artist=#{CGI::escape artist}&format=json&results=20&type=artist")
	# 	begin
	# 		response = JSON.parse(Net::HTTP.get(uri))
	# 		response["response"]["songs"][0]["title"]
	# 	rescue
	# 		"There was a problem"
	# 	end

	# end

end
